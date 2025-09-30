-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd("colorscheme ayu-dark")
--
-- vim.cmd("colorscheme lunaperche")
--
-- vim.cmd("colorscheme koehler")
--
-- vim.cmd("colorscheme base16-tokyodark")

-- paste without overwriting
vim.keymap.set("v", "p", "P")
vim.cmd("colorscheme citruszest")
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#87CEEB" }) -- Change header color
