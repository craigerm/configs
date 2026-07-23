local function augroup(name)
  return vim.api.nvim_create_augroup("xaugroup_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.filetype.add({
  filename = {
    [".dev.vars"] = "sh",
    [".dev.vars.test"] = "sh",
    ["dev.vars.example"] = "sh",
    [".env"] = "sh",
    [".env.example"] = "sh",
    ["env-schema"] = "sh",
  },
})

vim.api.nvim_set_hl(0, "EnvAnnotation", { fg = "#C586C0", italic = true })

local function add_env_annotation_match()
  local ft = vim.bo.filetype
  local name = vim.fn.expand("%:t")

  if ft ~= "sh" and ft ~= "bash" and ft ~= "zsh" and name ~= "env-schema" then
    return
  end

  local win_match_id = vim.w.env_annotation_match_id
  if win_match_id then
    pcall(vim.fn.matchdelete, win_match_id)
  end

  vim.w.env_annotation_match_id = vim.fn.matchadd("EnvAnnotation", [[#.*\zs@[A-Za-z0-9_:=-]\+]])
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("env_schema_annotations"),
  pattern = { "sh", "bash", "zsh" },
  callback = add_env_annotation_match,
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  group = augroup("env_schema_annotations_windows"),
  pattern = "*",
  callback = add_env_annotation_match,
})

