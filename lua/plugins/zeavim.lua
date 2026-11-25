return {
  "KabbAmine/zeavim.vim",
  -- Load plugin only when commands or keys are used
  cmd = { "Zeavim", "ZeavimV", "ZVVisSelection", "ZVOperator", "ZVKeyDocset" },
  keys = {
    -- Keybinding: <leader>z to search word under cursor
    { "<leader>z", "<Plug>Zeavim", desc = "Search Zeal Docs" },
    { "<leader>z", "<Plug>ZVVisSelection", mode = "v", desc = "Search selection in Zeal" },
  },
  init = function()
    -- Map Neovim filetypes to your exact installed Zeal docsets
    vim.g.zv_file_types = {
      svelte = "svelte,html,css,javascript,typescript,tailwindcss",
      typescriptreact = "react,javascript,typescript,tailwindcss",
      javascriptreact = "react,javascript,tailwindcss",
      javascript = "javascript,html,css",
      typescript = "typescript,javascript",
      html = "html,bootstrap5,tailwindcss",
      htmldjango = "django,html,bootstrap,tailwindcss",
      css = "css,bootstrap,tailwindcss",
      scss = "css,bootstrap,tailwindcss",
      python = "python3,django",
      rust = "rust",
      dockerfile = "docker",
    }
  end,
}
