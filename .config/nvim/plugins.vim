" Check installed
if ! filereadable(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/plugged"'))

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'christoomey/vim-tmux-navigator'

Plug 'itchyny/lightline.vim'

" Syntax-highlighting for JSX
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'brainfucksec/wal.vim'

Plug 'digitaltoad/vim-pug'

call plug#end()

