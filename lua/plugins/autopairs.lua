return {
  { "mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      map_cr = true, -- Natively handles splitting >< on Enter
    },
  },
}
