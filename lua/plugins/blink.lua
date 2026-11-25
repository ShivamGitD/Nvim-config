return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default", -- Natively maps <C-y> to accept and <C-n>/<C-p> to navigate
        ["<CR>"] = { "fallback" }, -- Always insert a normal newline on Enter instead of accepting
      },
      cmdline = {
        enabled = true, -- Natively provides live completions for : commands and / searches
      },
    },
  },
}
