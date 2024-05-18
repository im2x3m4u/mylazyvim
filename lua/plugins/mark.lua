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
      { "<c-t>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle file tags menu" },

      { ";q", "<cmd>Grapple select index=1<cr>", desc = "Select first file tags" },
      { ";w", "<cmd>Grapple select index=2<cr>", desc = "Select second file tags" },
      { ";e", "<cmd>Grapple select index=3<cr>", desc = "Select third file tags" },
      { ";r", "<cmd>Grapple select index=4<cr>", desc = "Select fourth file tags" },
      { ";t", "<cmd>Grapple select index=5<cr>", desc = "Select fifth file tags" },

      { "<c-j>", "<cmd>Grapple cycle backward<cr>", desc = "Go to previous file tag" },
      { "<c-k>", "<cmd>Grapple cycle forward<cr>", desc = "Go to next file tag" },
    },
  },
}
