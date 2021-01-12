" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
" Plug install packages
"*****************************************************************************
" Need to have pynvim installed to use.  Please see :help provider-python for details.  Also, running :checkhealth will be useful if you run into problems.
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsEditSplit="tabdo"

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='mupdf'
    let g:vimtex_quickfix_mode=0

" A Vim Plugin for Lively Previewing LaTeX PDF Output.  Change "updatetime"
" option for the time it takes to render.
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
let g:livepreview_previewer = 'evince'


Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'asvetliakov/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'inkarkat/vim-ReplaceWithRegister' " Makes gr Replace existing text with the contents of a register


" Terminal-only plugins
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
" Required
filetype plugin indent on

"*****************************************************************************
" Basic Setup
"*****************************************************************************
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


" Fix backspace indent
set backspace=indent,eol,start

" Fix copy/paste?
set clipboard+=unnamedplus

" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=4
set expandtab
" Show vertical tab indent guides (manual, no plugin)
" set list lcs=tab:\|\

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Time for CursorHold, and how long it take for live TeX to update.
set updatetime=250

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_autoload = "no"
" If the PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


" Set python3 location
let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/bin/python3"


"*****************************************************************************
" Key Remap
"*****************************************************************************
" Set leader to ','
let mapleader=','
" Set localleader to Space (used for WhichKey)
let g:maplocalleader = "\<Space>"

inoremap jj <Esc>
" used for moving one space in insert mode
inoremap qh <C-o>h
inoremap qj <C-o>j
inoremap qk <C-o>k
inoremap ql <C-o>l
" used for breaking out of brackets
inoremap qa <Esc>la

"*****************************************************************************
"*****************************************************************************
"*****************************************************************************
"
" Terminal Only Settings (Not run in VSCode)
"
"*****************************************************************************
"*****************************************************************************
"*****************************************************************************

if !exists('g:vscode')
set ruler
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END


colorscheme dracula

"*****************************************************************************
" Vim Airline
"*****************************************************************************
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:NERDTreeQuitOnOpen = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent><F2> :NERDTreeToggle<CR>

"*****************************************************************************
" Vim Airline
"*****************************************************************************
let g:airline_theme='dracula'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"*****************************************************************************
" GUI Options
"*****************************************************************************
set mousemodel=popup
set t_Co=256
set guioptions=egmrti

"*****************************************************************************
" Nerd Commenter
"*****************************************************************************

" [count]<leader>cs |NERDCommenterSexy| // Comments out the selected lines with a pretty block formatted layout.

" [count]<leader>cu |NERDCommenterUncomment| // Uncomments the selected line(s).
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"*****************************************************************************
" Whichkey
"*****************************************************************************
" My Whichkey setup is only set to utilize the localldeader which is set to
" space
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>

" How long a pause there is after a space before menu appears.  Also affects
" jj keybinding.
set timeoutlen=250
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" The next step is to add items to g:which_key_map:



" Define prefix dictionary
let g:which_key_map =  {}

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
" and descriptions for the existing mappings.
"
" Mappings to hide from top level menu.  If you decide to rebind these, you
" must delete from this list:
let g:which_key_map.p = 'which_key_ignore'
let g:which_key_map.j = 'which_key_ignore'
let g:which_key_map.k = 'which_key_ignore'
"
" Note:
" Some complicated ex-cmd may not work as expected since they'll be feed into `feedkeys()`, in which case you have to define a decicated
" Command or function wrapper to make it work with vim-which-key.
" Ref issue #126, #133 etc.
let g:which_key_map[' '] = {
      \ 'name' : '+Tabs, +Windows and +Buffers' ,
      \ '=' : ['<C-W>='     , 'balance-window'] ,
      \ 'a' : ['tabnew'        , 'new tab']        ,
      \ 'b' : {
            \ 'name': '+BUFFERS',
            \ 'n' : ['bnext'     , 'buffer next']     ,
            \ 'p' : ['bprevious' , 'buffer previous'] ,
            \ 'r' : [':source %' , 'refresh buffer'] ,
            \ },
      \ 'C' : ['tabo'        , 'close all other tabs']        ,
      \ 'c' : ['tabclose'        , 'close tab']        ,
      \ 'd' : ['bd'        , 'delete buffer']   ,
      \ 'h' : ['split'        , 'split window horizontal']        ,
      \ 'j' : ['tabnext'        , 'next tab']        ,
      \ 'k' : ['tabprevious'        , 'previous tab']        ,
      \ 'l' : {
            \ 'name': '+list',
            \ 'b' : ['Buffers'     , 'buffers']      ,
            \ 't' : ['tabs' , 'tabs'] ,
            \ 'w' : ['Windows' , 'windows']  ,
            \ },
      \ 'r' : [':source %' , 'refresh buffer'] ,
      \ 't' : {
            \ 'name': '+TABS',
            \ '1' : ['1gT'        , '1']        ,
            \ '2' : ['2gT'        , '2']        ,
            \ '3' : ['3gT'        , '3']        ,
            \ '4' : ['4gT'        , '4']        ,
            \ '5' : ['5gT'        , '5']        ,
            \ '6' : ['6gT'        , '6']        ,
            \ '7' : ['7gT'        , '7']        ,
            \ '8' : ['8gT'        , '8']        ,
            \ '9' : ['9gT'        , '9']        ,
            \ '0' : ['0gT'        , '0']        ,
            \ 'c' : ['tabclose'        , 'close tab']        ,
            \ 'j' : ['tabnext'        , 'next tab']        ,
            \ 'k' : ['tabprevious'        , 'previous tab']        ,
            \ 't' : ['tabnew'        , 'new tab']        ,
            \ },
      \ 'v' : ['vsplit'        , 'split window vertical']        ,
      \ 'w' : {
            \ 'name': '+WINDOWS',
            \ 'h' : ['split'        , 'split window horizontal']        ,
            \ 'q' : [':wq'        , 'close']        ,
            \ 'j' : [':wnext'        , 'next']        ,
            \ 'k' : [':wprevious'        , 'previous']        ,
            \ 'v' : ['vsplit'        , 'split window vertical']        ,
            \ 'w' : ['Windows' , 'windows']  ,
            \ },
      \ }

let g:which_key_map['R'] = {
      \ 'name' : '+Source %' ,
      \ 'R' : [':source %'        , 'Reload file']        ,
      \ 'I' : ['PlugInstall'        , 'Install Plugins in init.vim']        ,
      \ 'C' : ['PlugClean'        , 'Clean Plugins in init.vim']        ,
      \ 'U' : ['PlugUpdate'        , 'Update Plugins in init.vim']        ,
      \ }

let g:which_key_map['U'] = {
      \ 'name' : '+Snippets' ,
      \ 'U' : ['Snippets'        , 'View Snippets']        ,
      \ }

let g:which_key_map['f'] = {
      \ 'name' : '+file' ,
      \ 'f' : ['Files'        , 'Open via FZF']        ,
      \ 'h' : ['History'        , 'View File History']        ,
      \ 'd' : ['Files'        , 'Open in current directory']        ,
      \ 'w' : ['w !sudo tee %'        , 'Sudo Save (Read-Only Override)']        ,
      \ 'i' : [':e $MYVIMRC<CR>'        , 'open-init.vim']        ,
      \ }

let g:which_key_map['g'] = {
      \ 'name' : '+git' ,
      \ }

let g:which_key_map['/'] = {
      \ 'name' : '+Search' ,
      \ '?' : ['Windows!'    , 'fzf-window']            ,
      \ 'd' : ['Files'        , 'Search in all files in ./']        ,
      \ 'a' : ['Rg'        , 'Search in all files with ripgrep']        ,
      \ 'l' : ['BLines'        , 'Search in current buffer']        ,
      \ 'b' : ['Buffers'        , 'Search in all buffers']        ,
      \ }

let g:which_key_map['l'] = {
      \ 'name' : '+LaTeX' ,
      \ 'c' : ['VimtexCompile'        , 'compile']        ,
      \ 'v' : ['VimtexView'        , 'view']        ,
      \ 'l' : ['LLPStartPreview'        , 'view live']        ,
      \ 'r' : ['VimtexReload'        , 'reload']        ,
      \ 'k' : ['VimtexStop'        , 'stop']        ,
      \ 'i' : ['VimtexInfo'        , 'info']        ,
      \ 's' : ['VimtexCompileSelected'        , 'compile selected']        ,
      \ 'e' : ['VimtexErrors'        , 'errors']        ,
      \ 'o' : ['VimtexLog'        , 'log']        ,
      \ }

" let g:which_key_map['c'] = {
    " \ 'name' : '+comment' ,
    " \ 'SPC' : ['<plug>NERDCommenterToggle'        , 'Toggle']        ,
    " \ '$' : ['<plug>NERDCommenterToEOL'        , 'End Of Line Comment']        ,
    " \ 'A' : ['<plug>NERDCommenterAltDelims'        , 'Comment']        ,
    " \ 'a' : ['<plug>NERDCommenterAppend'        , 'EOL + Insert']        ,
    " \ 'c' : ['<plug>NERDCommenterNested'        , 'Comment']        ,
    " \ 's' : ['<plug>NERDCommenterSexy'        , 'Sexy']        ,
    " \ 'y' : ['<plug>NERDCommenterYank'        , 'Yank and Comment']        ,
    " \ 'u' : ['<plug>NERDCommenterUncomment'        , 'Uncomment']        ,
    " \ }

"*****************************************************************************
"*****************************************************************************
"*****************************************************************************

" END OF TERMINAL ONLY SETTINGS
endif

"*****************************************************************************
"*****************************************************************************
"*****************************************************************************

"*****************************************************************************
" Abbreviations
"*****************************************************************************
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

set mouse=a
map <LeftMouse> <NOP>
map <RightMouse> <NOP>

" Remaping Pgup Pgdn
map <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <Esc> :noh<CR><Esc>
nnoremap <CR> :noh<CR><CR>

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif


"*****************************************************************************
" On-the-fly spelling correction
"*****************************************************************************
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


"*****************************************************************************
" FZF
"*****************************************************************************
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
