require('nvim-tree').setup()

local api = require('nvim-tree.api')
local keymap = vim.keymap

keymap.set('n', '<leader>t', api.tree.toggle, {})
