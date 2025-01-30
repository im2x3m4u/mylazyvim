return {
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    config = function()
      require("tsc").setup({
        auto_open_qflist = true,
        auto_close_qflist = false,
        auto_focus_qflist = false,
        auto_start_watch_mode = false,
        use_trouble_qflist = true,
        use_diagnostics = true,
        run_as_monorepo = false,
        enable_progress_notifications = true,
        enable_error_notifications = true,
        flags = {
          noEmit = true,
          watch = false,
        },
        hide_progress_notifications_from_history = true,
        spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        pretty_errors = true,
      })
    end,
  },
  -- {
  --   "artemave/workspace-diagnostics.nvim",
  --   config = function()
  --     vim.api.nvim_set_keymap("n", "<space>cD", "", {
  --       desc = "Workspace Diagnostics",
  --       noremap = true,
  --       callback = function()
  --         for _, client in ipairs(vim.lsp.get_clients()) do
  --           require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
  --         end
  --       end,
  --     })
  --   end,
  -- },
}
