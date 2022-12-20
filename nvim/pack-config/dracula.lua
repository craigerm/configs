local dracula = require('dracula')
local colors = dracula.colors()

local s = 10

dracula.setup({
  colors = {
    gutter_fg = "#FF3322",
  },
  lualine_bg_color = "#44475a",
  overrides = {

    -- NvimTree
    NvimTreeNormal = { bg = colors.bg },
    NvimTreeFolderName = { fg = colors.bright_blue },
    NvimTreeOpenedFolderName = { fg = colors.bright_blue },

    NvimTreeGitStaged = { fg = colors.green },
    NvimTreeGitUnstaged = { fg = colors.comment },
    NvimTreeGitNew = { fg = colors.gutter_fg },

    VertSplit = { fg = colors.comment },

    -- NullLs Popup
    NullLsInfoBorder = { bg = colors.comment },

    -- LspInfo Popup
    LspInfoBorder = { fg = colors.comment },

    -- Diagnostic signs
    DiagnosticSignHint = { fg = colors.comment },

    -- Diagnostics Virtual
    DiagnosticVirtualTextHint = { fg = colors.comment },
  }
})
