-- File: ~/.config/nvim/lua/plugins/lsp.lua

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        oxlint = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
          },
        },
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                configFile = "src/app.css",
              },
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            "html",
            "htmldjango",
            "css",
            "scss",
            "javascriptreact",
            "typescriptreact",
            "svelte",
          },
        },
        djlsp = {
          filetypes = { "htmldjango" },
        },
      },
    },
  },
}
