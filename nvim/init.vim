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

let mapleader=" "

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" leave xclipboard untouched after nvim exit
autocmd vimleave * exe ":!echo " . shellescape(getreg('+')) . " | xclip -selection clipboard"

" for netrw ,detele buffers once they are hidden
autocmd FileType netrw setl bufhidden=delete

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

" set background=light
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_contrast_dark = "medium"
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


" add spaces below/above
nnoremap ]<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap [<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

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

set ignorecase
set smartcase
set noswapfile
set noshowmode
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
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
set diffopt+=iwhite " No whitespace in vimdiff

let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace = 0


let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'right': '~40%' }
let g:fzf_preview_window = ''

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
nnoremap <silent> <leader><leader> :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>s :Rg<CR>
nnoremap <silent> <leader>h :History:<CR>

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
