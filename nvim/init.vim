map s <Nop>
map Q <Nop>
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
" Plug 'davidhalter/jedi-vim'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'liuchengxu/vista.vim'

" Colors
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" different usefull plugins
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'

" " git
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'

" fzf
Plug 'airblade/vim-rooter'
Plug 'yuki-ycino/fzf-preview.vim'

Plug 'rust-lang/rust.vim'

call plug#end()

" to write to maybe non-existing folder/file ..
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" 0 to first non-black char
nnoremap 0 ^
nnoremap ^ 0

set showtabline=2

let mapleader=" "

nnoremap <silent> <leader>fp            :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> <leader>fgs           :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> <leader><leader>      :<C-u>FzfPreviewBuffers<CR>
" nnoremap <silent> <leader>fB            :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> <leader>ff            :<C-u>FzfPreviewFromResources directory project_mru<CR>
nnoremap <silent> <leader>fo            :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> <leader>f<C-o>        :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> <leader>ft            :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> <leader>fq            :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> <leader>fl            :<C-u>FzfPreviewLocationList<CR>

" source config
nnoremap <silent> <leader>rr    :<C-u>source ~/dots/nvim/init.vim<CR>

" list yank list
nnoremap <silent> <leader>y  :<C-u>CocList --normal yank<cr>

" autocmd User targets#mappings#user call targets#mappings#extend({
"     \ 'b': {
"     \   'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}, {'o':'<', 'c':'>'} ],
"     \   'quote': [{'d':"'"}, {'d':'"'}, {'d':'`'}],
"     \ }
"     \ })


set timeoutlen=1000

nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l

nnoremap <silent> <leader>= <C-w>=
nnoremap <silent> <C-h> :vertical resize -4<CR>
nnoremap <silent> <C-j> :resize +4<CR>
nnoremap <silent> <C-k> :resize -4<CR>
nnoremap <silent> <C-l> :vertical resize +4<CR>

nnoremap <leader>oo :e $MYVIMRC<CR>

nnoremap <leader>of :Files<CR>

nnoremap <leader>ot :Tags<CR>

nnoremap <leader>oc :Commands<CR>

nnoremap <leader>q  :q!<CR>
" smart case in sneak
let g:sneak#use_ic_scs = 1

nmap Y y$
nmap D ld$

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END


nmap <leader>w :w<CR>
nmap ``         <c-^>

" for netrw ,detele buffers once they are hidden
" autocmd FileType netrw setl bufhidden=delete

" Ctrl-k - delete til end of line in insert mode
" inoremap <C-k> <C-o>C

" replace f/F/t/T with sneakF
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

" ctrl +j/k for command line history
cnoremap <c-j> <down>
cnoremap <c-k> <up>

nnoremap <leader>k :<Up>

" colorscheme darkblue
colorscheme one
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
            \   'left':  [ [ 'mode'], ['readonly', 'relativepath', 'modified'], ['cocstatus']],
            \   'right': [ [ 'lineinfo' ], [ 'percent' ],[ 'filetype' ]],
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ },
            \ 'colorscheme': 'onedark',
            \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" add spaces below/above
nnoremap <silent> gj o<Esc>k
nnoremap <silent> gk O<Esc>j



" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_format = '[%linter%] %s' 
let g:ale_linters = {
    \   'python': ['flake8', 'pycodestyle'],
    \   'rust': ['analyzer'],
    \}

let g:ale_linters_explicit = 1
let g:rustfmt_autosave = 1

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

" nnoremap <silent> j jzz
" nnoremap <silent> k kzz
" nnoremap <silent> n nzz
" nnoremap <silent> N Nzz

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" let g:fzf_preview_window = 'down:50%'
let g:fzf_preview_window = 'right:70%:hidden' 

nnoremap <silent> <Esc> :nohlsearch<CR><C-L>

"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>

"wipeout current buffer
nnoremap <leader>bw :bp <bar> bw! #<cr>
" nnoremap <leader>q  :q!<CR>

"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>

" fzf commands
" nnoremap <silent> <leader><leader> :Buffers<CR>
nnoremap <silent> <leader>s :Rg<CR>
" nnoremap <silent> <leader>hc :History:<CR>
" nnoremap <silent> <leader>hf :History<CR>

" for ycm commands
" nnoremap <leader>jt :YcmCompleter GoTo<CR>
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>jo :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gt :YcmCompleter GetType<CR>

" let g:ycm_min_num_of_chars_for_completion = 88
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_key_list_stop_completion = ['<C-c>']
" let g:ycm_key_list_select_completion = ['<TAB>']
" let g:ycm_server_python_interpreter = '/usr/bin/python'
" let g:ycm_python_binary_path = 'python'
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" " Enable paste in insert mode
cnoremap <C-R> <C-R>+
inoremap <C-R> <C-G>u<C-R>+

let g:python3_host_prog = "/usr/bin/python3"

"Move lines up and down"
nnoremap <C-Up> :m-2<cr>==
nnoremap <C-Down> :m+<cr>==
xnoremap <C-Up> :m-2<cr>gv=gv
xnoremap <C-Up> :m'>+<cr>gv=gv

" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

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


" Coc settings
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"     \ <SID>check_back_space() ? "\<TAB>" :
nmap <leader>ac  <Plug>(coc-codeaction)

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr><Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <silent><expr><S-Tab>
    \ pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <C-j> <Plug>(coc-snippets-expand-jump)
imap <C-k> <Plug>(coc-snippets-expand)

" inoremap <silent><expr> <cr> coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<CR>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
imap <C-c> <C-e>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Find symbol of current document.
nnoremap <silent><nowait> <space>re  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>ll  :<C-u>CocListResume<cr>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" hi Normal guibg=NONE ctermbg=NONE  
" hi CursorLine term=underline cterm=underline guibg=NONE
" hi CursorLineNr guibg=NONE guifg=NONE
