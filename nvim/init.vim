call plug#begin('~/.local/share/nvim/plugged')

" Plug 'Shougo/deoplete.nvim', { 'for': 'python' }
" Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
" Plug 'davidhalter/jedi-vim'


" Plug 'arcticicestudio/nord-vim'
" Plug 'morhetz/gruvbox'


Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colors
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-commentary'

Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" fzf
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'

" Plug 'rust-lang/rust.vim'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'natebosch/vim-lsc'

call plug#end()

let g:coc_disable_startup_warning = 1

set showtabline=2

let g:lsc_server_commands = {'python': 'pyls'}
let g:lsc_auto_map = v:true

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>

let mapleader=" "

" smart case in sneak
let g:sneak#use_ic_scs = 1

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }

nmap D ld$
nmap Y y$
nmap Q :q<cr>

inoremap <C-j> <Esc>
" nnoremap <Tab> :bn<CR>
" nnoremap <S-Tab> :bp<CR>

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

autocmd FileType json syntax match Comment +\/\/.\+$+

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

nmap <leader>w :w<CR>
nmap <leader>q :bp <bar> bd! #<cr>

" leave xclipboard untouched after nvim exit
" autocmd vimleave * exe ":!echo " . shellescape(getreg('+')) . " | xclip -selection clipboard"

" for netrw ,detele buffers once they are hidden
autocmd FileType netrw setl bufhidden=delete

" disable Ex mode

" Ctrl-k - delete til end of line in insert mode
inoremap <C-k> <C-o>C

" replace f/F/t/T with sneakF
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

" ctrl +j/k for command line history
cnoremap <c-j> <down>
cnoremap <c-k> <up>

nnoremap <leader>k :<Up>

let g:gruvbox_contrast_dark = "soft"
colorscheme onedark
let g:lightline = {
            \ 'component': {
            \   'lineinfo': '%3l,%-2v',
            \   'buffs': 'buffers',
            \ },
            \ 'mode_map': {
            \ 'n': 'N',
            \ 'i': 'I',
            \ 'v': 'V',
            \ 'V': 'VL',
            \ "\<C-v>": 'VB',
            \ },
            \ 'tabline': {
            \   'left': [ ['buffers'] ],
            \   'right': [[ 'buffs' ]]
            \ },
            \ 'component_expand': {
            \   'buffers': 'lightline#bufferline#buffers'
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel'
            \ },
            \ 'active': {
            \   'left':  [ [ 'mode'], ['readonly', 'relativepath', 'modified']],
            \   'right': [ [ 'lineinfo' ], [ 'percent' ],[ 'filetype' ]],
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ 'colorscheme': 'onedark',
            \ }

" add spaces below/above
nnoremap <silent> gj o<Esc>k
nnoremap <silent> gk O<Esc>j

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_format = '[%linter%] %s' 
let g:ale_linters = {
\       'python': ['flake8', 'pycodestyle'],
\}
let g:ale_linters_explicit = 1

set wildmode=longest,full
set signcolumn=yes
set ignorecase
set smartcase
set noswapfile
set noshowmode
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
set completeopt=menu,noinsert,noselect
" set completeopt-=preview
set shiftwidth=4
set softtabstop=4   
set tabstop=4
set expandtab
set nowrap
set inccommand=nosplit
set scrolloff=5
set sidescrolloff=6
set number relativenumber
set termguicolors
set diffopt+=iwhite " No whitespace in vimdiff

let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace = 0


let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'right': '~50%' }
let g:fzf_preview_window = 'down:50%'

nnoremap <silent> <Esc> :nohlsearch<CR><C-L>
"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
"close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>

" fzf commands
nnoremap <silent> <leader><leader> :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>s :Rg<CR>
nnoremap <silent> <leader>hc :History:<CR>
nnoremap <silent> <leader>hf :History<CR>
nnoremap <silent> <leader>cc :Commands<CR>

" for ycm commands
nnoremap <leader>jt :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jo :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>

" let g:ycm_min_num_of_chars_for_completion = 88
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_stop_completion = ['<C-c>']
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python'
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" " Enable paste in insert mode
cnoremap <C-R> <C-R>+
inoremap <C-R> <C-G>u<C-R>+

let g:python3_host_prog = "/usr/bin/python3"

let g:AutoPairsMultilineClose = 0
let g:AutoPairsMoveCharacter = ''

"Move lines up and down"
nnoremap <M-k> :m-2<cr>==
nnoremap <M-j> :m+<cr>==
xnoremap <M-k> :m-2<cr>gv=gv
xnoremap <M-j> :m'>+<cr>gv=gv

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" paste with newline in normal mode
nmap <leader>p o<esc>p

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

"persist in v-mode after >> <<"
vmap < <gv
vmap > >gv


"update index"
"nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

set hidden
syntax enable
set undofile
set splitbelow splitright
set clipboard=unnamedplus

" delete to blackhole
nnoremap x "_x
nnoremap d "_d
vnoremap d "_d
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap C "_C

" delete to clipboard
nnoremap <leader>d "+d
vnoremap <leader>d "+d

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr><Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


""unmap <C-Space>
let g:deoplete#enable_at_startup = 1
inoremap <expr><C-g>            deoplete#cancel_popup()
inoremap <expr><C-c>            deoplete#close_popup()
" inoremap <expr><C-SPACE>        deoplete#manual_complete()
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
let g:deoplete#sources#jedi#show_docstring = 0 
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#show_call_signatures = "2"
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction
hi Normal guibg=NONE ctermbg=NONE  
hi CursorLine term=underline cterm=underline guibg=NONE
hi CursorLineNr guibg=NONE guifg=#81b9db
