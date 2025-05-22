vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.cursorline = true

vim.opt.undofile = true
vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.scrolloff = 10

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
