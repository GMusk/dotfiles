" _   _ _          ______  _____
"| | | (_)         | ___ \/  __ \
"| | | |_ _ __ ___ | |_/ /| /  \/
"| | | | | '_ ` _ \|    / | |
"\ \_/ / | | | | | | |\ \ | \__/\
" \___/|_|_| |_| |_\_| \_| \____/
"--------------------------------

 "-----------------------------"
"           General             "
"-------------------------------"

" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype indent plugin on

" :W sudo saves the file @amix3k
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

 "-----------------------------"
"              UI               "
"-------------------------------"

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" unmap pageup and down as xps bad placement.
noremap <Pageup> <nop>
noremap <Pagedown> <nop>
inoremap <Pageup> <nop>
inoremap <PageDown> <nop>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
"set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

"-----------------------------"
"           Plugins             "
"-------------------------------"

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

so ~/.vim/plugins.vim
