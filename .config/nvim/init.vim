" Plugins
source ~/.config/nvim/plugins.vim

let mapleader = "" 

" Colorscheme :O
" colorscheme wal

"security vuln
set nomodeline

" Fold using indenation
set foldmethod=indent
set nofoldenable

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" stop going to start of line of certain movements
set nostartofline

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number relativenumber

" better ux
set updatetime=300

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F2>

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Indentation options
set shiftwidth=4
set softtabstop=4
set expandtab

" PYX setting
set pyx=3

" Useful mappings

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" 
set inccommand=nosplit
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <a-l> :nohl <CR>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" fzf
nnoremap <silent> <C-f> :Files<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

