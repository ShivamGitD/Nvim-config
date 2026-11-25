return {
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(name)
        return name ~= "stylelint_lsp"
      end, opts.ensure_installed or {})
    end,
  },
}
