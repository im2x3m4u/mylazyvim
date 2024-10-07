return {
  {
    "luozhiya/fittencode.nvim",
    config = function(opts)
      require("fittencode").setup(opts)
      vim.api.nvim_set_hl(0, "CmpItemKindFittenCode", { fg = "#6CC644" })
    end,
  },
}
