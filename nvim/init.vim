let g:coc_disable_startup_warning = 1
call plug#begin('~/.local/share/nvim/plugged') " Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
" Plug 'davidhalter/jedi-vim'

Plug 'rust-lang/rust.vim'
Plug 'udalov/kotlin-vim'

" Autocomplete, LSP, Linting
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colors
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
" Plug 'neovim/nvim-lsp'

" different usefull plugins
Plug 'mhinz/vim-startify'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'

" git
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'

" Plug 'lambdalisue/gina.vim/'

" fuzzy search
Plug 'airblade/vim-rooter'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'voldikss/vim-floaterm'
call plug#end()

imap <C-BS> <C-W>
let g:netrw_fastbrowse = 0
let g:floaterm_autoclose = 2
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

hi ActiveWindow guibg=#282c34
hi InactiveWindow guibg=#2E3440

function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

nnoremap <leader>cd :cd %:p:h<CR>

augroup WindowManagement
  autocmd!  
  autocmd WinEnter * call Handle_Win_Enter()
augroup END


vmap y ygv<Esc>

nmap        <M-p>   o<ESC>p
nmap        <M-S-p>   O<ESC>p
" Map Ctrl + Shift + j/k to move lines down/up
nnoremap    ^]j     :m+<cr>==
nnoremap    ^]k     :m-2<cr>==
vnoremap    ^]j     :m '>+1<CR>gv=gv
vnoremap    ^]k     :m '<-2<CR>gv=gv

nnoremap    <C-t>       :FloatermToggle<CR>
nnoremap    <leader>tn  :FloatermNew<CR>
tnoremap    <Esc>       <C-\><C-n>
tnoremap    <C-t>       <C-\><C-n>:FloatermToggle<CR>

function! GoToNextIndent(inc)
    " Get the cursor current position
    let currentPos = getpos('.')
    let currentLine = currentPos[1]
    let matchIndent = 0

    " Look for a line with the same indent level whithout going out of the buffer
    while !matchIndent && currentLine != line('$') + 1 && currentLine != -1
        let matchIndent = indent(currentLine) == indent('.')
        let currentLine += a:inc
    endwhile

    " If a line is found go to this line
    if (matchIndent)
        let currentPos[1] = currentLine
        call setpos('.', currentPos)
    endif
endfunction

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <C-o>b
inoremap <C-l> <C-o>w
nmap <C-j> <C-d>
nmap <C-k> <C-u>
vmap <C-j> <C-d>
vmap <C-k> <C-u>
nnoremap <C-h> ^
nnoremap <C-l> $

" vim-rooter config
let g:rooter_patterns = ['=src', 'Cargo.toml']

" ____________________________________________________
" CLAP CONFIG
let g:clap_layout = { 'relative': 'editor' }
let g:clap_insert_mode_only = v:true
let g:clap_disable_run_rooter = v:true
let g:clap_theme = { 
\ 'clap_default_current_selection': { 'ctermfg': 'green' },
\ 'clap_display': { 'ctermfg': 'white' }
\}

augroup FocusAfterClap
  autocmd!
  " autocmd User ClapOnEnter   call YourFunction()
  autocmd User ClapOnExit    call lightline#update()
augroup END

" ____________________________________________________
" PEAR_TREE CONFIG
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_ft_disabled = ['clap_input']
let g:pear_tree_map_special_keys = 0
let g:pear_tree_smart_backspace = 1
imap <BS> <Plug>(PearTreeBackspace)
imap <Esc> <Plug>(PearTreeFinishExpansion)
imap <silent><expr> <CR>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand',''])\<CR>" :
    \ "\<Plug>(PearTreeExpand)"

" to write to maybe non-existing folder/file ..
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" " 0 to first non-black char
" nnoremap 0 ^
" nnoremap ^ 0

" TABLINE 
" set showtabline=2

let mapleader=" "

" Fuzzy mapping
nnoremap <silent> <leader><leader>      :<C-u>Clap buffers<CR>
nnoremap <silent> <leader>fp            :<C-u>Clap gfiles<CR>
nnoremap <silent> <leader>fh            :<C-u>Clap history<CR>
nnoremap <silent> <leader>ff            :<C-u>Clap files<CR>
nnoremap <silent> <leader>fe            :<C-u>Clap filer<CR>

" list yank list
nnoremap <silent> <leader>y             :<C-u>Clap yanks<CR>

" source nvim config
nnoremap <silent> <leader>rr    :<C-u>source ~/dots/nvim/init.vim<CR>


" open my nvim config file
nnoremap <leader>oo :e $MYVIMRC<CR>

" Move lines up and down
" nnoremap <M-j> :m+<cr>==
" nnoremap <M-k> :m-2<cr>==
" xnoremap <M-j> :m'>+<cr>gv=gv
" xnoremap <M-k> :m-2<cr>gv=gv

" " window resize with Alt + arrows
" nnoremap <M-Up>     :res +3<CR>
" nnoremap <M-Down>   :res -3<CR>
" nnoremap <M-Left>   :vertical res -3<CR>
" nnoremap <M-Right>  :vertical res +3<CR>


set timeoutlen=1000

" smart case in sneak
let g:sneak#use_ic_scs = 1

nmap Y y$
nmap D ld$
nmap <leader>w  :w<CR>
nmap <leader>q  :q!<CR>

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END


nmap ``         <C-w><C-w>

" replace f/F/t/T with sneakF
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

" ctrl +j/k for command line history
cnoremap <c-j> <down>
cnoremap <c-k> <up>

let g:lightline = {
            \ 'component': {
            \   'lineinfo': '%3l,%-2v',
            \ },
            \ 'mode_map': {
            \ 'n': 'N',
            \ 'i': 'I',
            \ 'v': 'V',
            \ 'V': 'VL',
            \ "\<C-v>": 'VB',
            \ },
            \ 'active': {
            \   'left':  [ [ 'mode'], ['readonly', 'relativepath', 'modified'], ['cocstatus']],
            \   'right': [ [ 'lineinfo' ], [ 'percent' ],[ 'filetype' ]],
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ },
            \ 'colorscheme': 'one',
            \ }

colorscheme one

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

nnoremap <silent> <Esc> :nohlsearch<CR><C-L>

"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>

"wipeout current buffer
nnoremap <leader>bw :bp <bar> bw! #<cr>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" " Enable paste in insert mode
cnoremap <C-R> <C-R>+
inoremap <C-R> <C-G>u<C-R><C-o>+

nnoremap <silent> <leader>dt :windo diffthis<CR>
nnoremap <silent> <leader>do :windo diffoff<CR>
let g:python3_host_prog = "/bin/python"


" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" paste with newline in normal mode
nmap <leader>p o<esc>p

"persist in v-mode after >> <<"
vmap < <gv
vmap > >gv

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

nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" delete to clipboard
nnoremap <leader>d "+d
vnoremap <leader>d "+d


" Coc settings
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>ac  <Plug>(coc-codeaction-selected)

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr><Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <silent><expr><S-Tab>
    \ pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <C-j> <Plug>(coc-snippets-expand-jump)
imap <C-k> <Plug>(coc-snippets-expand)
" inoremap <C-r> <C-r>*

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

" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Find symbol of current document.
" nnoremap <silent><nowait> <leader>out  :<C-u>CocList outline<cr>
" nnoremap <silent><nowait> <leader>re  :<C-u>CocListResume<cr>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" hi Normal guibg=NONE ctermbg=NONE  
" hi CursorLine term=underline cterm=underline guibg=NONE
" hi CursorLineNr guibg=NONE guifg=NONE
