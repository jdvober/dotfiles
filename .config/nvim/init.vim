" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" Need to have pynvim installed to use.  Please see :help provider-python for details.  Also, running :checkhealth will be useful if you run into problems.
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsEditSplit="vertical"

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'asvetliakov/vim-easymotion'
Plug 'honza/vim-snippets'
call plug#end()
" Required
filetype plugin indent on

" ""****************************************************************************"
" "" Basic Setup
" "*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start

"" Fix copy/paste?
set clipboard+=unnamedplus

"" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=4
set expandtab
"" Show vertical tab indent guides (manual, no plugin)
" set list lcs=tab:\|\

"" Map leader to ,
let mapleader=','
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

"" Enable hidden buffers
set hidden

"" Searching
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


" " Set python3 location
let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/bin/python3"

" "*****************************************************************************
" "" Terminal Only Settings (Not run in VSCode)
" "*****************************************************************************
if !exists('g:vscode')
set ruler
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

inoremap jj <Esc>
" used for moving one space in insert mode
inoremap qh <C-o>h
inoremap qj <C-o>j
inoremap qk <C-o>k
inoremap ql <C-o>l
" used for breaking out of brackets
inoremap qa <Esc>la
endif

" "*****************************************************************************
" "" Visual Settings
" "*****************************************************************************

" "*****************************************************************************
" "" Abbreviations
" "*****************************************************************************
" "" no one is really happy until you have this shortcuts
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

"" Remaping Pgup Pgdn
map <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>
"
"This unsets the "last search pattern" register by hitting return
nnoremap <Esc> :noh<CR><Esc>

"" Easymotion
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

"" Copy/Paste/Cut
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
"" On-the-fly spelling correction
"*****************************************************************************
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
