return {
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    keys = {
      { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      {
        "<leader>cs",
        "<cmd>CodeSnapSave<cr>",
        mode = "x",
        desc = "Save selected code snapshot in ~/Documents/ScreenShots/",
      },
    },
    opts = {
      title = "Code by Adi Setyono",
      code_font_family = "CaskaydiaCove Nerd Font",
      save_path = "~/Documents/ScreenShots",
      has_breadcrumbs = true,
      bg_theme = "dusk", -- bamboo,sea,grape,dusk,peach,summer
      -- bg_color = "#535c68",
      has_line_number = true,
      bg_x_padding = 28,
      bg_y_padding = 28,
      watermark = "@im2x3m4u",
    },
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    keys = { { "<leader>cn", "<cmd>CarbonNow<cr>", mode = "x", desc = "Carbon Now" } },
    config = function()
      local carbon = require("carbon-now")
      carbon.setup({
        options = {
          theme = "solarized",
          font_family = "Monoid",
          titlebar = "Code by Adi Setyono",
        },
      })
    end,
  },
}
