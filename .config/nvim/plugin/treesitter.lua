require'nvim-treesitter.configs'.setup {
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = true,
  },
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
  }
}
