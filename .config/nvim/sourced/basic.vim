" 
" 
"  /$$$$$$$                      /$$                  /$$$$$$              /$$                        
" | $$__  $$                    |__/                 /$$__  $$            | $$                        
" | $$  \ $$  /$$$$$$   /$$$$$$$ /$$  /$$$$$$$      | $$  \__/  /$$$$$$  /$$$$$$   /$$   /$$  /$$$$$$ 
" | $$$$$$$  |____  $$ /$$_____/| $$ /$$_____/      |  $$$$$$  /$$__  $$|_  $$_/  | $$  | $$ /$$__  $$
" | $$__  $$  /$$$$$$$|  $$$$$$ | $$| $$             \____  $$| $$$$$$$$  | $$    | $$  | $$| $$  \ $$
" | $$  \ $$ /$$__  $$ \____  $$| $$| $$             /$$  \ $$| $$_____/  | $$ /$$| $$  | $$| $$  | $$
" | $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$|  $$$$$$$      |  $$$$$$/|  $$$$$$$  |  $$$$/|  $$$$$$/| $$$$$$$/
" |_______/  \_______/|_______/ |__/ \_______/       \______/  \_______/   \___/   \______/ | $$____/ 
"                                                                                           | $$      
"                                                                                           | $$      
"                                                                                           |__/      

"*****************************************************************************
" Auto-reload init.vim on change
"*****************************************************************************

au BufWritePost ~/.config/nvim/init.vim so $MYVIMRC


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

"*****************************************************************************
" Encoding
"*****************************************************************************

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"*****************************************************************************
" Fix backspace indent
"*****************************************************************************

set backspace=indent,eol,start


"*****************************************************************************
" Fix copy/paste?
"*****************************************************************************

set clipboard+=unnamedplus

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
" noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif


"*****************************************************************************
" Tabs. May be overridden by autocmd rules
"*****************************************************************************

set tabstop=4 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
set softtabstop=4 " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces. 
set shiftwidth=4 " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation. 
set noexpandtab " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces. 


"*****************************************************************************
" On-the-fly spelling correction
"*****************************************************************************

augroup spell
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave *.tex,*.md,*.txt setlocal spell
augroup END

" setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"*****************************************************************************
" Show vertical tab indent guides (manual, no plugin)
"*****************************************************************************

" set list lcs=tab:\|\
set list lcs=tab:\|┈

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1


"*****************************************************************************
" Enable hidden buffers
"*****************************************************************************

set hidden


"*****************************************************************************
" Searching
"*****************************************************************************

set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if WINDOWS()
	set shell=powershell.exe
elseif LINUX()
	set shell=$SHELL
endif

" if exists('$SHELL')
	" set shell=$SHELL
" else
	" set shell=/bin/sh
" endif


"*****************************************************************************
" Time for CursorHold, and how long it take for live TeX to update.
"*****************************************************************************

set updatetime=250


"*****************************************************************************
" If the PC is fast enough, do syntax highlight syncing from start unless 200 lines
"*****************************************************************************

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END


"*****************************************************************************
" Remember cursor position
"*****************************************************************************

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END



"*****************************************************************************
" Set python3 location
"*****************************************************************************

let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/bin/python3"

set termguicolors



"  /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$                                
" |______/|______/|______/|______/|______/|______/|______/|______/                                
"  /$$    /$$  /$$$$$$   /$$$$$$                  /$$             
" | $$   | $$ /$$__  $$ /$$__  $$                | $$             
" | $$   | $$| $$  \__/| $$  \__/  /$$$$$$   /$$$$$$$  /$$$$$$    
" |  $$ / $$/|  $$$$$$ | $$       /$$__  $$ /$$__  $$ /$$__  $$   
"  \  $$ $$/  \____  $$| $$      | $$  \ $$| $$  | $$| $$$$$$$$   
"   \  $$$/   /$$  \ $$| $$    $$| $$  | $$| $$  | $$| $$_____/   
"    \  $/   |  $$$$$$/|  $$$$$$/|  $$$$$$/|  $$$$$$$|  $$$$$$$   
"     \_/     \______/  \______/  \______/  \_______/ \_______/   
"  /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$
" |______/|______/|______/|______/|______/|______/|______/|______/
                                                                
if !exists('g:vscode')

set ruler
set number relativenumber


set mousemodel=popup
" set t_Co=256
set guioptions=egmrti

"*****************************************************************************
" Alacritty support for mouse
"*****************************************************************************

"set ttymouse=sgr

"*****************************************************************************
" Platforms
"*****************************************************************************

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

endif
