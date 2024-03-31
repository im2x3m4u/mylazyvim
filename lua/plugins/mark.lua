return {
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git", -- also try out "git_branch"
      icons = false, -- setting to "true" requires "nvim-web-devicons"
      status = false,
    },
    keys = {
      { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
      { "<c-t>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

      { "<leader>ma", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
      { "<leader>mb", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
      { "<leader>mc", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
      { "<leader>md", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },

      { "<leader>mp", "<cmd>Grapple cycle backward<cr>", desc = "Go to previous tag" },
      { "<leader>mn", "<cmd>Grapple cycle forward<cr>", desc = "Go to next tag" },
    },
  },
}
