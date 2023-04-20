local dracula = require('dracula')
local colors = dracula.colors()

dracula.setup({
  lualine_bg_color = "#44475a",
  overrides = {

    -- NvimTree
    NvimTreeNormal = { bg = colors.bg },
    NvimTreeFolderName = { fg = colors.bright_blue },
    NvimTreeOpenedFolderName = { fg = colors.bright_blue },

    NvimTreeGitStaged = { fg = colors.green },
    NvimTreeGitUnstaged = { fg = colors.comment },
    NvimTreeGitNew = { fg = colors.gutter_fg },

    FzfLuaCursorLine = { fg = "#0000ff", bg = colors.green },

    VertSplit = { fg = colors.comment },

    -- NullLs Popup
    NullLsInfoBorder = { bg = colors.comment },

    -- LspInfo Popup
    LspInfoBorder = { fg = colors.comment },

    -- Diagnostic signs
    DiagnosticSignHint = { fg = colors.comment },

    -- Diagnostics Virtual
    DiagnosticVirtualTextHint = { fg = colors.comment },

    -- Status line
    StatusLine = { fg = colors.white , bg = colors.black, bold = true},
    StatusLineNC = { fg = colors.comment, bg = colors.menu, bold = true},

    -- Current line
    CursorLine = { bg = "#2f334d" },
    Cursor = { bg = "#ff0000"},

    -- Misc HTML, JS without TS
    htmlTag = { fg = colors.purple },
    htmlTagN = { fg = colors.purple },
    htmlTagName = { fg = colors.bright_blue },
    htmlEndTag = { fg = colors.purple },
    PreProc = { fg = colors.orange },
    javaScriptGlobal = { fg = colors.pink },
    Special = { fg = colors.green },
    liquidExpression = { fg = colors.bright_red },
    htmlSpecialTagName =  {fg = colors.purple },

    -- Treesitter
    ["@property"] = { fg = colors.purple },
    ["@type"] = { fg = colors.green },
    ["@punctuation.bracket"] = { fg = colors.fg },
  }
})
