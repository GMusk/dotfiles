" Check installed
if ! filereadable(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/autoload/plug.vim"'))
    echo 'Downloading junegunn/vim-plug to manage plugins...'
    silent !mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/autoload/
    silent !curl 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

let g:airline_theme='onehalfdark'

let s:coc_extensions = ['coc-tsserver', 'coc-prettier', 'coc-html', 'coc-eslint']

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kyazdani42/nvim-tree.lua'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'christoomey/vim-tmux-navigator'

" Syntax-highlighting for JSX
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Syntax highlighting for Prisma
Plug 'prisma/vim-prisma'

" Terraform highlighting 
Plug 'hashivim/vim-terraform'

" colorschemes
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

