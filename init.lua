-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd("colorscheme ayu-dark")
--
-- vim.cmd("colorscheme lunaperche")
--
-- vim.cmd("colorscheme koehler")
--
-- vim.cmd("colorscheme base16-tokyodark")
vim.opt.langmap:append("jkl\\;';hjkl\\;")
-- paste without overwriting
vim.keymap.set("v", "p", "P")
-- motion keys (left, down, up, right)
vim.keymap.set("n", "J", "6j")
vim.keymap.set("n", "H", "0^")
vim.keymap.set("n", "L", "$")

vim.cmd("colorscheme citruszest")
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#87CEEB" }) -- Change header color
