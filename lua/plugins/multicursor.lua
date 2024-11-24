return {
  -- {
  --   "smoka7/multicursors.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "smoka7/hydra.nvim",
  --   },
  --   opts = {},
  --   cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  --   keys = {
  --     {
  --       mode = { "v", "n" },
  --       "<Leader>m",
  --       "<cmd>MCstart<cr>",
  --       desc = "Create a selection for selected text or word under the cursor",
  --     },
  --   },
  -- },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    -- event = "BufRead",
    -- fn = { "vm#commands#add_cursor_up", "vm#commands#add_cursor_down" },
    keys = { "<c-n>" },
    config = function()
      vim.g.VM_Extend_hl = "VM_Extend_hl"
      vim.g.VM_Cursor_hl = "VM_Cursor_hl"
      vim.g.VM_Mono_hl = "VM_Mono_hl"
      vim.g.VM_Insert_hl = "VM_Insert_hl"

      vim.g.VM_default_mappings = 0
      vim.g.VM_mouse_mappings = 0
      vim.g.VM_maps = {
        ["I BS"] = "", -- disable backspace mapping
        ["Find Under"] = "<c-n>",
        ["Find Subword Under"] = "<C-n>",
        ["Find Prev"] = "<c-p>",
        ["Skip Region"] = "<c-s>",
        ["Select Cursor Down"] = "<C-Down>",
        ["Select Cursor Up"] = "<C-Up>",
      }
    end,
  },
}
