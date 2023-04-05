require 'plugins'

local g = vim.g
local cmd = vim.cmd

g.mapleader = [[ ]]

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

local opt = vim.opt

-- disable mouse
opt.mouse = ''
-- security vulnerability
opt.modeline = false
-- show whitespace
opt.list = true
-- Use case insensitive search, except when using capital letters
opt.ignorecase = true
opt.smartcase = true
-- Display line numbers on the left
opt.number = true
-- Indentation options
-- (https://gist.github.com/LunarLambda/4c444238fb364509b72cfb891979f1dd)
opt.expandtab = true
opt.tabstop = 2        -- Optional, if you want files with tabs to look the same too.
opt.shiftwidth = 2
-- Use value of shiftwidth
opt.softtabstop = -1
-- true color support
opt.termguicolors = true
-- replace number with sign
opt.signcolumn = 'number'
-- eh
opt.updatetime = 300
-- eh
opt.inccommand = 'nosplit'

require('onedark').load()

local keymap = vim.keymap
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('nvim-tree').setup()
local api = require('nvim-tree.api')
keymap.set('n', '<leader>t', api.tree.toggle, {})
