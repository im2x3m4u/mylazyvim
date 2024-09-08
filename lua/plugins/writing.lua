return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    cmd = { "RenderMarkdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    opts = {
      heading = {
        position = "inline",
        sign = true,
        signs = { "󰫎 " },
        border = true,
        width = "full",
        icons = { " 󰲡 ", " 󰲣 ", " 󰲥 ", " 󰲧 ", " 󰲩 ", " 󰲫 " },
      },
      code = {
        sign = true,
        style = "full",
        width = "block",
        min_width = 60,
        left_pad = 2,
        language_pad = 2,
      },
      pipe_table = {
        preset = "round",
      },
      sign = {
        enabled = true,
        highlight = "RenderMarkdownSign",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        ui = { enable = false },
        workspaces = {
          {
            name = "Project Notes",
            path = "/Users/adisetyono/Drive Saya/Share Folder Bootstraping Teams",
          },
          {
            name = "Personal Notes",
            path = "/Users/adisetyono/Google Drive/Badger Notes",
          },
        },
      })
    end,
  },
}
