require("blink.cmp").setup({
  -- Available presets:
  -- "default"   -> Ctrl-y accepts
  -- "super-tab" -> Tab accepts
  -- "enter"     -> Enter accepts
  -- "none"      -> configure everything yourself
  keymap = {
    preset = "super-tab",
  },

  sources = {
    default = {
      "lsp",
      "path",
      -- "supermaven",
      "snippets",
      "buffer",
    },
  },

  signature = {
    enabled = true,
  },

  completion = {
    accept = { auto_brackets = { enabled = false } },
    menu = {
      draw = {
        columns = {
          { "kind_icon", gap = 1 },
          { "label", "label_description", gap = 0 },
        },
        components = {
          label_description = {
            -- width = { max = 30 },
            text = function(ctx)
              if ctx.label_description ~= "" then
                return ctx.label_description
              end

              -- ts_ls doesn't return this in label_description so it is always blank
              if ctx.item.client_name == "ts_ls" then
                return ctx.item.detail or ""
              end

              return ""
            end,

            highlight = "BlinkCmpGhostText",
          },
        },
      },
    },
  },
})
