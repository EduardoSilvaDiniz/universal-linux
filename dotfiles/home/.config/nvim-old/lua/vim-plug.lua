local cmd = vim.cmd
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'farfanoide/vim-kivy'
Plug 'L3MON4D3/LuaSnip'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
--Plug 'vim-airline/vim-airline'
--Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'ervandew/supertab'
Plug('neoclide/coc.nvim', {branch = 'realese'})
vim.call('plug#end')
