" Plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/tree.lua

let mapleader = " "

" colors
set t_Co=256
colorscheme onehalfdark

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" disable mouse (tmux copy enable)
set mouse=

" whitespace showing (listchars)
set list

"security vulnerability
set nomodeline

" Fold using indentation
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
set number

" ALlow toggle of relativenumber
nmap <Leader>n :set invrelativenumber<CR>

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
" (https://gist.github.com/LunarLambda/4c444238fb364509b72cfb891979f1dd)
set expandtab
set tabstop=4      " Optional, if you want files with tabs to look the same too.
set shiftwidth=4
set softtabstop=-1 " Use value of shiftwidth

command -nargs=1 Indset set shiftwidth=<args>

" PYX setting
set pyx=3

" Useful mappings

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Enter> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

"
set inccommand=nosplit

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <Leader>l :nohl<CR>

" search visual selection
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo

" fzf
nnoremap <silent> <C-f> :Files<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Coc

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Prettier command
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" NvimTreeToggle
nmap <Leader>t :NvimTreeToggle<CR>

" VsCode
nmap <Leader>c :! code .<CR>
