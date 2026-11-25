return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        svelte = { "prettierd" },
        html = { "prettierd" },
        htmldjango = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        css = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
      },
    },
  },
}
