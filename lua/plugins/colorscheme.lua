-- return {
--   -- 1. Configure tokyonight to use the "night" style
--   {
--     "folke/tokyonight.nvim",
--     opts = { style = "night" },
--   },
--
--   -- 2. Configure LazyVim to load tokyonight-night on startup
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "tokyonight-night",
--     },
--   },
-- }

return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      overrides = function()
        return {
          ["@none.svelte"] = { link = "NONE" },
          ["@keyword"] = { fg = "#ff69b4", bold = true },
          ["@keyword.typescript"] = { fg = "#ff69b4", bold = true },
          ["@keyword.javascript"] = { fg = "#ff69b4", bold = true },
          ["@keyword.svelte"] = { fg = "#ff69b4", bold = true },
          ["@keyword.modifier"] = { fg = "#ff69b4", bold = true },
          ["@keyword.function"] = { fg = "#ff69b4", bold = true },
          ["@keyword.conditional"] = { fg = "#ff69b4", bold = true },
          ["@property"] = { fg = "#00ffff" },
          ["@property.typescript"] = { fg = "#00ffff" },
          ["@property.declaration"] = { fg = "#00ffff" },
          ["@variable.member"] = { fg = "#00ffff" },
          ["@type.builtin"] = { fg = "#da70d6", italic = true },
          ["@type.builtin.typescript"] = { fg = "#da70d6", italic = true },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
}
