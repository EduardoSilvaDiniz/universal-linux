local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- mapleader key
g.mapleader = ','

-- General Setup
opt.mouse = 'a'
opt.swapfile = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240

-- Theme
opt.termguicolors = true
cmd [[ colorscheme gruvbox ]]

--lualine
local custom_gruvbox = require'lualine.themes.gruvbox'
require('lualine').setup{
  options = {
    theme = custom_gruvbox,
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_x = {'filetype'},
    lualine_y = {}
  }
}


-- Editor
opt.number = true
opt.wrap = false
opt.signcolumn = 'yes'
opt.showmatch = true
opt.showmode = false
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true
--opt.canceallevel = 0
--opt.colorcolumn = 80
opt.cursorline = true
opt.scrolloff = 10
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.list = true
--opt.listchars = { oel = }
opt.shortmess:append { c = true }
opt.whichwrap:append 
{ 
   ['<'] = true,
   ['>'] = true,
   [','] = true,
   h = true,
   l = true
}
