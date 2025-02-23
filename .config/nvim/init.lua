require 'plugins'

vim.g.mapleader = [[ ]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

opt.foldmethod = 'indent'
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

-- Define a global variable to keep track of the state
if not vim.g.toggle_number_state then
  vim.g.toggle_number_state = 1
end

-- function to cycle line number, rel number, neither
function ToggleNumber(direction)
  if direction == "forward" then
    vim.g.toggle_number_state = (vim.g.toggle_number_state + 1) % 3
  elseif direction == "backward" then
    vim.g.toggle_number_state = (vim.g.toggle_number_state + 2) % 3
  end
end

-- Map <leader>n to call the ToggleNumber function in forward direction
vim.api.nvim_set_keymap('n', '<leader>n', ':lua ToggleNumber("forward")<CR>', { noremap = true, silent = true })

-- Map <leader>N to call the ToggleNumber function in backward direction
vim.api.nvim_set_keymap('n', '<leader>N', ':lua ToggleNumber("backward")<CR>', { noremap = true, silent = true })
