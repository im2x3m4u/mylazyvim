-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = require("utils.map") --

local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
  end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", ",st", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

map.bulk_register({
  {
    mode = { "n" },
    lhs = "<m-g>",
    rhs = "ci{",
    options = { silent = true },
    description = "Change in {}",
  },
  {
    mode = { "n" },
    lhs = "<m-t>",
    rhs = "ci(",
    options = { silent = true },
    description = "Change in ()",
  },
  {
    mode = { "n" },
    lhs = "<m-d>",
    rhs = 'ci"',
    options = { silent = true },
    description = "Change in double quotes",
  },
  {
    mode = { "n" },
    lhs = "<m-s>",
    rhs = "ci'",
    options = { silent = true },
    description = "Change in single quotes",
  },
  {
    mode = { "n" },
    lhs = "<c-k>",
    rhs = function()
      if vim.diagnostic.is_enabled() then
        vim.diagnostic.enable(false)
      else
        vim.diagnostic.enable()
      end
    end,
    options = { silent = true },
    description = "Toggle diagnostic",
  },
  {
    mode = { "n" },
    lhs = "<leader>/",
    rhs = function()
      require("Comment.api").toggle.linewise.current()
    end,
    options = { silent = true },
    description = "Toggle Comment",
  },
  {
    mode = { "v" },
    lhs = "<leader>/",
    rhs = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    options = { silent = true },
    description = "Toggle Comment",
  },
  {
    mode = { "n" },
    lhs = "<leader>tf",
    rhs = "<cmd>ToggleTerm direction=float<cr>",
    options = { silent = true },
    description = "Float Terminal",
  },
  {
    mode = { "n" },
    lhs = "<leader>th",
    rhs = "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    options = { silent = true },
    description = "Horizontal Terminal",
  },
  {
    mode = { "n" },
    lhs = "<leader>tv",
    rhs = "<cmd>ToggleTerm size=80 direction=vertical<cr>",
    options = { silent = true },
    description = "Vertical Terminal",
  },
  {
    mode = { "n" },
    lhs = "<c-f>",
    rhs = "<cmd>lua vim.lsp.buf.format{async=true}<cr>",
    options = { silent = true },
    description = "Format Code",
  },
  {
    mode = { "n" },
    lhs = "<leader>fr",
    rhs = "<cmd>lua require('telescope.builtin').resume()<CR>",
    options = { silent = true },
    description = "Resume Last Find",
  },
  {
    mode = { "n" },
    lhs = "<leader>fu",
    rhs = "<cmd>lua require('telescope.builtin').find_files({find_command={'fd', vim.fn.expand('<cword>')}})<CR>",
    options = { silent = true },
    description = "Find files under cursor",
  },
  {
    mode = { "n" },
    lhs = "<leader>fg",
    rhs = "<cmd>lua require('telescope.builtin').grep_string()<CR>",
    options = { silent = true },
    description = "Find Word in files",
  },
  {
    mode = { "n" },
    lhs = "fu",
    rhs = "<cmd>lua require('telescope.builtin').find_files({find_command={'fd', vim.fn.expand('<cword>')}})<CR>",
    options = { silent = true },
    description = "Find files under cursor",
  },
  {
    mode = { "n" },
    lhs = "ff",
    rhs = "<cmd>lua require('telescope.builtin').find_files()<CR>",
    options = { silent = true },
    description = "Find files",
  },
  {
    mode = { "n" },
    lhs = "fb",
    rhs = "<cmd>lua require('telescope.builtin').buffers()<CR>",
    options = { silent = true },
    description = "Find buffers",
  },
  {
    mode = { "n" },
    lhs = "fr",
    rhs = "<cmd>lua require('telescope.builtin').resume()<CR>",
    options = { silent = true },
    description = "Resume Last Find",
  },
  {
    mode = { "n" },
    lhs = "fm",
    rhs = "<cmd>lua require('telescope.builtin').marks()<CR>",
    options = { silent = true },
    description = "Find marks",
  },
  {
    mode = { "n" },
    lhs = "fg",
    rhs = "<cmd>lua require('telescope.builtin').grep_string()<CR>",
    options = { silent = true },
    description = "Find word in files",
  },
  {
    mode = { "n" },
    lhs = "fq",
    rhs = "<cmd>lua require('telescope.builtin').quickfix()<CR>",
    options = { silent = true },
    description = "Find quickfix",
  },
  {
    mode = { "n" },
    lhs = "fo",
    rhs = "<cmd>Navbuddy<CR>",
    options = { silent = true },
    description = "Find symbols",
  },
  {
    mode = { "n" },
    lhs = "fv",
    rhs = "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
    options = { silent = true },
    description = "Find references",
  },
  {
    mode = { "n" },
    lhs = "fd",
    rhs = "<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<CR>",
    options = { silent = true },
    description = "Find diagnostics in current buffer",
  },
  {
    mode = { "n" },
    lhs = "fw",
    rhs = "<cmd>lua require('telescope.builtin').live_grep()<CR>",
    options = { silent = true },
    description = "Find text in files",
  },
  {
    mode = { "n" },
    lhs = "fe",
    rhs = "<cmd>lua require('telescope.builtin').find_files({cwd = vim.fn.expand('%:p:h')})<cr>",
    options = { silent = true },
    description = "Find Files Here",
  },
  {
    mode = { "n" },
    lhs = ";",
    rhs = ":",
    options = { silent = false },
    description = "Enter Command Mode",
  },
  {
    mode = { "v" },
    lhs = "<tab>",
    rhs = ">gv",
    options = { silent = true },
    description = "block indent left",
  },
  {
    mode = { "v" },
    lhs = "<s-tab>",
    rhs = "<gv",
    options = { silent = true },
    description = "block indent right",
  },
  {
    mode = { "v" },
    lhs = "<leader>y1",
    rhs = '"ay',
    options = { silent = true },
    description = "copy to register a",
  },
  {
    mode = { "v" },
    lhs = "<leader>y2",
    rhs = '"by',
    options = { silent = true },
    description = "copy to register b",
  },
  {
    mode = { "v" },
    lhs = "<leader>y3",
    rhs = '"cy',
    options = { silent = true },
    description = "copy to register c",
  },
  {
    mode = { "v" },
    lhs = "<leader>y4",
    rhs = '"dy',
    options = { silent = true },
    description = "copy to register d",
  },
  {
    mode = { "v" },
    lhs = "<leader>y5",
    rhs = '"ey',
    options = { silent = true },
    description = "copy to register e",
  },
  {
    mode = { "v" },
    lhs = "<leader>y6",
    rhs = '"fy',
    options = { silent = true },
    description = "copy to register f",
  },
  {
    mode = { "i" },
    lhs = "<c-y>",
    rhs = function()
      require("fittencode").accept_all_suggestions()
    end,
    options = { silent = true },
    description = "Accept all sugestion",
  },
  -- {
  --   mode = { "n", "i" },
  --   lhs = "<C-c>",
  --   rhs = "yy",
  --   options = { silent = true },
  --   description = "copy a line",
  -- },
  {
    mode = { "n", "v" },
    lhs = "<leader>v",
    rhs = '"0p',
    options = { silent = true },
    description = "paste from register",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>p1",
    rhs = '"ap',
    options = { silent = true },
    description = "paste from register a",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>p2",
    rhs = '"bp',
    options = { silent = true },
    description = "paste from register b",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>p3",
    rhs = '"cp',
    options = { silent = true },
    description = "paste from register c",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>p4",
    rhs = '"dp',
    options = { silent = true },
    description = "paste from register d",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>p5",
    rhs = '"ep',
    options = { silent = true },
    description = "paste from register e",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>p6",
    rhs = '"fp',
    options = { silent = true },
    description = "paste from register f",
  },
  {
    mode = { "n" },
    lhs = "<c-x>",
    rhs = "dd",
    options = { silent = true },
    description = "Delete line",
  },
  -- {
  --   mode = { "n" },
  --   lhs = "<leader>bo",
  --   rhs = function()
  --     for _, buf in ipairs(vim.t.bufs) do
  --       if buf ~= vim.api.nvim_get_current_buf() then
  --         vim.cmd("bd " .. buf)
  --       end
  --     end
  --     -- require('nvchad_ui.tabufline').closeOtherBufs("")
  --   end,
  --   options = { silent = true },
  --   description = "Close all other buffers",
  -- },
  {
    mode = { "n" },
    lhs = "<c-q>",
    rhs = ":bd<cr>",
    options = { silent = true },
    description = "Close current buffer",
  },
  {
    mode = { "n" },
    lhs = "<c-b>",
    rhs = ":bn<cr>",
    options = { silent = true },
    description = "Next buffer",
  },
  {
    mode = { "i" },
    lhs = "jj",
    rhs = "<esc>",
    options = { silent = true },
    description = "Escape editor insert mode",
  },
  {
    mode = { "t" },
    lhs = "<esc>",
    rhs = "<c-\\><c-n>",
    options = { silent = true },
    description = "Escape terminal insert mode",
  },
  {
    mode = { "n" },
    lhs = "<esc>",
    rhs = ":noh<cr>",
    options = { silent = true },
    description = "Clear search highlight",
  },
  {
    mode = { "n", "x" },
    lhs = "k",
    rhs = function()
      return vim.v.count > 0 and "k" or "gk"
    end,
    options = { silent = true, expr = true },
    description = "Move up one line",
  },
  {
    mode = { "n", "x" },
    lhs = "j",
    rhs = function()
      return vim.v.count > 0 and "j" or "gj"
    end,
    options = { silent = true, expr = true },
    description = "Move down one line",
  },
  {
    mode = { "n", "x" },
    lhs = "H",
    rhs = function()
      return vim.v.count > 0 and "^" or "g^"
    end,
    options = { silent = true, expr = true },
    description = "Move to the first character at the beginning of the line",
  },
  {
    mode = { "n", "x" },
    lhs = "L",
    rhs = function()
      return vim.v.count > 0 and "$" or "g$"
    end,
    options = { silent = true, expr = true },
    description = "Move to the last character at the end of the line",
  },
  {
    mode = { "n", "i" },
    lhs = "<C-s>",
    rhs = "<cmd>wall!<CR>",
    options = { silent = true },
    description = "Save All Buffers",
  },
  {
    mode = { "n" },
    lhs = "<leader>mt",
    rhs = function()
      -- Toggle a tag on the current buffer
      require("grapple").toggle()
    end,
    options = { silent = true },
    description = "Toggle file tag",
  },
  {
    mode = { "n" },
    lhs = "<C-a>",
    rhs = "ggVGy<C-o>",
    options = { silent = false },
    description = "Select all text",
  },
  -- {
  --   mode = { "n" },
  --   lhs = "<leader>mj",
  --   rhs = function()
  --     -- Cycle to the next tagged file
  --     require("grapple").cycle_forward()
  --   end,
  --   okkkkkkkkk
  --   options = { silent = true },
  --   description = "Cycle next tag",
  -- },
  -- {
  --   mode = { "n" },
  --   lhs = "<leader>mk",
  --   rhs = function()
  --     -- Cycle to the previous tagged file
  --     require("grapple").cycle_backward()
  --   end,
  --   options = { silent = true },
  --   description = "Cycle previous tag",
  -- },
  -- {
  --   mode = { "n" },
  --   lhs = "<leader>mp",
  --   rhs = function()
  --     -- Open the tags popup menu in the current scope
  --     require("grapple").popup_tags()
  --   end,
  --   options = { silent = true },
  --   description = "Popup tags",
  -- },
  {
    mode = { "n" },
    lhs = "<leader>uz",
    rhs = function()
      -- Toggle zen mode
      require("zen-mode").toggle({
        window = {
          width = 0.85,
        },
      })
    end,
    options = { silent = true },
    description = "Toggle Zen Mode",
  },
})
