require 'plugins'

local g = vim.g
local cmd = vim.cmd

g.mapleader = [[ ]]

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.clipboard = {
  name = tmuxClipboard,
  copy = {
    ['+'] = {'tmux', 'load-buffer', '-'},
  },
  paste = {
    ['+'] = {'tmux', 'save-buffer', '-'},
  },
  cache_enabled = 1,
}

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
-- dont create swap files
opt.swapfile = false

opt.foldmethod = 'expr'
opt.foldexpr = 'indent'
--Disable folding at startup
opt.foldenable = false

require('onedark').load()

require('os')

-- function to output time now
function timeNow()
  local time = os.time()
  vim.api.nvim_set_current_line('[' .. os.date("%x", time) ..']')
end
vim.keymap.set('n', '<leader>tn', '<cmd>lua timeNow()<cr>')

-- function to cycle line number, rel number, neither 

