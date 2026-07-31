local conform = require("conform")

local function buffer_dir(bufnr)
  local filename = vim.api.nvim_buf_get_name(bufnr)

  if filename == "" then
    return vim.uv.cwd()
  end

  return vim.fs.dirname(filename)
end

local function file_exists(path)
  return vim.uv.fs_stat(path) ~= nil
end

local function package_json_contains(bufnr, package_name, config_key)
  local dir = buffer_dir(bufnr)

  while dir do
    local package_json = vim.fs.joinpath(dir, "package.json")

    if file_exists(package_json) then
      local ok_read, lines = pcall(vim.fn.readfile, package_json)

      if ok_read then
        local ok_decode, package =
          pcall(vim.json.decode, table.concat(lines, "\n"))

        if ok_decode and type(package) == "table" then
          -- Supports configuration inside package.json, such as:
          -- { "prettier": { ... } }
          if config_key and package[config_key] ~= nil then
            return true
          end

          for _, section in ipairs({
            "dependencies",
            "devDependencies",
            "peerDependencies",
            "optionalDependencies",
          }) do
            if
              type(package[section]) == "table"
              and package[section][package_name] ~= nil
            then
              return true
            end
          end
        end
      end
    end

    local parent = vim.fs.dirname(dir)

    if parent == dir then
      break
    end

    dir = parent
  end

  return false
end

local function has_config(bufnr, filenames)
  return vim.fs.find(filenames, {
    path = buffer_dir(bufnr),
    upward = true,
  })[1] ~= nil
end

local function uses_oxfmt(bufnr)
  return has_config(bufnr, {
    ".oxfmtrc.json",
    ".oxfmtrc.jsonc",
    "oxfmt.config.ts",
  }) or package_json_contains(bufnr, "oxfmt", "oxfmt")
end

local function uses_prettier(bufnr)
  return has_config(bufnr, {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.json5",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    ".prettierrc.toml",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.mjs",
    ".prettierrc.ts",
    ".prettierrc.cts",
    ".prettierrc.mts",
    "prettier.config.js",
    "prettier.config.cjs",
    "prettier.config.mjs",
    "prettier.config.ts",
    "prettier.config.cts",
    "prettier.config.mts",
  }) or package_json_contains(bufnr, "prettier", "prettier")
end

local function javascript_formatter(bufnr)
  -- Prefer Oxfmt if a project temporarily contains both.
  if uses_oxfmt(bufnr) then
    return { "oxfmt" }
  end

  if uses_prettier(bufnr) then
    return {
      "prettierd",
      "prettier",
      stop_after_first = true,
    }
  end

  -- Do not impose a formatter on projects that declare neither.
  return {}
end

conform.setup({
  default_format_opts = {
    timeout_ms = 3000,
    lsp_format = "never",
  },

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = javascript_formatter,
    typescript = javascript_formatter,
    javascriptreact = javascript_formatter,
    typescriptreact = javascript_formatter,
    markdown = javascript_formatter,
    -- Liquid formatter doesn't seem to work with prettierd (TODO: does oxfmt work?)
    liquid = { "prettier" },
    css = javascript_formatter,
    html = javascript_formatter,
    json = javascript_formatter,
    jsonc = javascript_formatter,
    yaml = javascript_formatter,
    scss = javascript_formatter,
    graphql = javascript_formatter,
    -- elixir = { "mix" },
  },

  -- log_level = vim.log.levels.DEBUG,
  format_on_save = {
    timeout_ms = 2000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>cF", function()
  return require("conform").format({ formatters = { "injected" } })
end, {})
