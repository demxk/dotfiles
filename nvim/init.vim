let g:python3_host_prog = "/usr/bin/python3"
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'Shougo/deoplete.nvim' 
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
" Plug 'https://github.com/Valloric/YouCompleteMe'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make','for':'go'}
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'wellle/targets.vim'
Plug 'junegunn/fzf.vim'
call plug#end()

" leave xclipboard untouched after nvim exit
autocmd vimleave * exe ":!echo " . shellescape(getreg('+')) . " | xclip -selection clipboard"

" disable Ex mode
nnoremap Q <nop>

" Ctrl-k - delete til end of line in insert mode
inoremap <C-k> <C-o>C

" replace f/F/t/T with sneakF
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" ctrl +j/k for command line history
cnoremap <c-j> <down>
cnoremap <c-k> <up>

nnoremap <leader>jj :<Up>

let mapleader=" "
set background=light
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_contrast_dark = "soft"
colorscheme gruvbox
let g:lightline = {
            \ 'component': {
            \   'lineinfo': '%3l,%-2v',
            \ },
            \ 'active': {
            \   'right': [ [ 'lineinfo' ], [ 'percent' ],
            \              ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ 'colorscheme': 'one',
            \ }
highlight Search ctermbg=white ctermfg=Brown



nnoremap ]<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap [<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <ESC> :noh<CR>

" resize windows by + - < >
nmap <C-W>= <C-w>2+
nmap <C-W>- <C-w>2-
nmap <C-W>> <C-w>2>
nmap <C-W>< <C-w>2<
nmap <C-W>+ <C-w>=
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set noshowmode
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
set winwidth=50
set winheight=20
set completeopt=menuone,noinsert,noselect
set completeopt-=preview
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
set cursorline

let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace = 0


let g:fzf_layout = { 'right': '~50%' }

nnoremap <silent> <Esc> :nohlsearch<CR><C-L>
"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
"close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>
""Tab to switch to next open buffer
"nnoremap <Tab> :bnext<cr>
""Shift + Tab to switch to previous open buffer
"nnoremap <S-Tab> :bprevious<cr>
"leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" " Enable paste in insert mode
inoremap <C-R> <C-G>u<C-R>+


let g:AutoPairsMultilineClose = 0
let g:AutoPairsMoveCharacter = ''

"Move lines up and down"
nnoremap <M-k> :m-2<cr>==
nnoremap <M-j> :m+<cr>==
xnoremap <M-k> :m-2<cr>gv=gv
xnoremap <M-j> :m'>+<cr>gv=gv


"persist in v-mode after >> <<"
vmap < <gv
vmap > >gv

set nobackup
set noswapfile

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
nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap C "_C

let g:pymode_options_colorcolumn = 0

"unmap <C-Space>
let g:jedi#completions_command = "<C-Space>"


let g:pymode_python = 'python3'
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 0 

let g:jedi#completions_enabled = 1
let g:jedi#goto_definitions_command = "<leader>d"
let g:pymode_syntax_space_errors = 0

autocmd FileType python setlocal formatprg=autopep8\ -
