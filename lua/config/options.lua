-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local setting = {}

setting.g = {
  mapleader = " ",
}

setting.opt = {
  cmdheight = 0,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  copyindent = true,
  smartindent = true,
  wrap = true,
  ruler = false,
  showmode = false,
  signcolumn = "yes:1",
  --[[ signcolumn = "number", ]]
  completeopt = "menuone,noselect",
  pumheight = 10,
  updatetime = 500,
  timeoutlen = 500,
  termguicolors = true,
  cursorline = true,
  numberwidth = 2,
  number = true,
  relativenumber = true,
  colorcolumn = "100",
  scrolloff = 10,
  mouse = "a",
  list = true,
  spell = true,
  spelllang = "en_us,cjk",
  incsearch = true,
  ignorecase = false,
  smartcase = true,
  hlsearch = false,
  filetype = "plugin",
  -- foldmethod = "indent",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  foldcolumn = "1",
  clipboard = "unnamedplus",
  iskeyword = "@,48-57,_,192-255",
  laststatus = 3,
  linebreak = true,
  fillchars = "eob: ",
  fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1",
  sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals",

  -- Behaviour
  hidden = true,
  errorbells = false,
  swapfile = false,
  backup = false,
  undodir = vim.fn.expand("~/.vim/undodir"),
  undofile = true,
  backspace = "indent,eol,start",
  splitright = true,
  splitbelow = true,
  autochdir = false,
  modifiable = true,
  guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
  encoding = "UTF-8",
}

-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("tab:↹ ")

vim.opt.iskeyword:append("-")
vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")
-- vim.g.loaded_python3_provider=1
vim.g.python3_host_prog = "/usr/local/bin/python3.10"
-- vim.g.nvim_tree_respect_buf_cwd = 1
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.relativenumber = true
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>]e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>]q', vim.diagnostic.setloclist)

for prefix, tbl in pairs(setting) do
  for key, value in pairs(tbl) do
    vim[prefix][key] = value
  end
end

local disable_builtin_plugins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, builtin_plugin in ipairs(disable_builtin_plugins) do
  vim.g["loaded_" .. builtin_plugin] = 1
end
