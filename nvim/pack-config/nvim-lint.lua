local lint = require('lint')
local M = {}

lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}

function M.debounce(ms, fn)
  local timer = vim.loop.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,

  vim.keymap.set('n', '<leader>l', function()
    lint.try_lint()
  end)
})
