local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')

npairs.setup({
  check_ts = true,

  -- Experiment to see if I like this one..
  enable_check_bracket_line = true,

  -- disable_filetype = { "TelescopePrompt" , "vim" },

  ts_config = {
    -- Will not add a pair for these treesitter nodes
    lua = { 'string' },
    javascript = { 'template_string' },
    java = false -- Example to disable
  }
})

-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule('%', '%', 'lua')
    :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
  Rule('$', '$', 'lua')
    :with_pair(ts_conds.is_not_ts_node({ 'function' }))
})
