" For using an init.vim from version control, make the local init.vim in
" ~/.config/nvim/init.vim a symlink to the version control version.
"
" ex:
"" ln -s ~/github.com/jdvober/References/nvim/init.vim ~/.config/nvim/init.vim

" Make sure to install language servers for coc (:CocInstall coc-go
" coc-tsserver coc-json)

" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
 " silent !curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  " endif
"
"
"
" " When nodejs is installed with snap
if isdirectory('/snap/node')
    let g:coc_node_path = '/snap/node/current/bin/node'
endif


" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lspconfig'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmsvg/pear-tree'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'

":HardTimeToggle :HardTimeOn :HardTimeOff
Plug 'takac/vim-hardtime'

" Themes: See 'Visual Settings' section to set theme (ex: colorscheme
" Papercolor)

"colorscheme Papercolor
Plug 'NLKNguyen/papercolor-theme'
"colorscheme nord
Plug 'arcticicestudio/nord-vim'
"colorscheme dracula
Plug 'dracula/vim',{'as':'dracula'}
"colorscheme oceanic-primal
Plug 'barlog-m/oceanic-primal-vim' 
"colorscheme night-owl
Plug 'haishanh/night-owl.vim'
"colorscheme daycula
Plug 'ghifarit53/daycula-vim', {'branch':'main'}
"colorscheme sonokai
Plug 'sainnhe/sonokai'
"colorscheme doom-one
Plug 'romgrk/doom-one.vim'


" Coc Languages
" Try just :CocInstall foo first
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-go', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" " Plug 'neoclide/coc-jedi', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
" Should run :CocInstall coc-ultisnips if using Ultisnips



call plug#end()
" Required
filetype plugin indent on

""****************************************************************************"
"" Basic Setup
"*****************************************************************************"
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

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_autoload = "no"

let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/bin/python3"
"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set ruler
set number relativenumber

colorscheme dracula
let g:airline_theme='bubblegum'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

let no_buffers_menu=1
set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
:syntax enable


"Gui Options
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
" set gfn="Jetbrains Mono"\ 12


"" Disable the blinking cursor.
set gcr=a:blinkon0

" au TermEnter * setlocal scrolloff=0
" au TermLeave * setlocal scrolloff=3


"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

if (has("termguicolors"))
    set termguicolors
endif

" vim-airline
"
" Set at top of section
" let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
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

"" Movement Rebinds
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
"" Scrolling and changing what the mouse buttons do
set mouse=a
map <LeftMouse> <NOP>
map <RightMouse> <NOP>

"" Remaping Pgup Pgdn
map <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>



let g:hardtime_default_on = 1
" let g:hardtime_timeout = 1000
let g:hardtime_showmsg = 0
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
" Allows jjj but not jjjj
let g:hardtime_maxcount = 3


"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:NERDTreeQuitOnOpen = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F3> :NERDTreeFind<CR>
nnoremap <silent><F2> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" " terminal emulation
nnoremap <silent> <F1> :terminal<CR>

" folding
"
" Set automatic folding on file open.  Toggled with F9
" set foldmethod=syntax
set foldmethod=indent
set foldenable
" set nofoldenable
set foldnestmax=1
" set foldlevelstart=99
set foldlevel=0
" set foldclose=all
"
" Function to change the way folds are displayed
function! MyFoldText()
    let nblines = v:foldend - v:foldstart + 1
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let line = getline(v:foldstart)
    let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let expansionString = repeat(".", w - strwidth(nblines.comment.'"'))
    let txt = '"' . comment . expansionString . nblines
    return txt
endfunction
set foldtext=MyFoldText()

inoremap <F9> <C-O>za
nnoremap <F9> za
nnoremap <Space> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Save folds on exit or save file
" This is a simple script to autosave cursor position and fold
"       information using vim's mkview. Although you can do this with
"       a couple of lines in your vimrc, this takes care of a few
"       possible error conditions. Requires a newish Vim. (TODO: how new?)
"
"       Views will be saved when you write a file or exit.
"
"       This script does not apply any specific view options, so you'll
"       need to set your own. E.g.: 
"
set viewoptions=cursor,folds,slash,unix

if exists("g:loaded_restore_view")
    finish
endif
let g:loaded_restore_view = 1

if !exists("g:skipview_files")
    let g:skipview_files = []
endif

function! MakeViewCheck()
    if &l:diff | return 0 | endif
    if &buftype != '' | return 0 | endif
    if expand('%') =~ '\[.*\]' | return 0 | endif
    if empty(glob(expand('%:p'))) | return 0 | endif
    if &modifiable == 0 | return 0 | endif
    if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
    if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

    let file_name = expand('%:p')
    for ifiles in g:skipview_files
        if file_name =~ ifiles
            return 0
        endif
    endfor

    return 1
endfunction

augroup AutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre,BufWinLeave ?* if MakeViewCheck() | silent! mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

inoremap jj <Esc>
" used for moving one space in insert mode
inoremap qh <C-o>h
inoremap qj <C-o>j
inoremap qk <C-o>k
inoremap ql <C-o>l
" used for breaking out of brackets
inoremap qa <Esc>la

"This unsets the "last search pattern" register by hitting return
nnoremap <Esc> :noh<CR><Esc>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

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

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" " session management
" nnoremap <leader>so :OpenSession<Space>
" nnoremap <leader>ss :SaveSession<Space>
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>

"" Tabs
" nnoremap <C-Tab> gt
" nnoremap <C-S-Tab> gT
" nnoremap <silent> <C-S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

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

" "" Buffer nav
" noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************



augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  " au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>gt :GoAddTags <CR>
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END



"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
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
"" IndentLine
"*****************************************************************************
" let g:indentLine_enabled = 1
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 2
" " let g:indentLine_char = '|'
" "" For a discinct indent character for each indentation level
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_faster = 1

"*****************************************************************************
"" Vim-Indent-Guides
"*****************************************************************************
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"*****************************************************************************
"" Rainbow Brackets
"*****************************************************************************
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody', 
\		}
\	}
\}



"*****************************************************************************
"" Coc
"*****************************************************************************

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Show documentation on hover
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" To get correct comment highlighting, you can install vim-jsonc (which has built-in support for coc-settings.json), or even simply add:
autocmd FileType json syntax match Comment +\/\/.\+$+

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" let g:coc_global_extensions = ['coc-emoji', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-ultisnips', 'coc-go', 'coc-html']

"*****************************************************************************
"" Pear Tree
"*****************************************************************************
 
" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 0
" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"*****************************************************************************
"" Nerd Commenter
"*****************************************************************************
" 

" [count]<leader>cs |NERDCommenterSexy| // Comments out the selected lines with a pretty block formatted layout.

" [count]<leader>cu |NERDCommenterUncomment| // Uncomments the selected line(s).


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
"" Vim-go
"*****************************************************************************
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"
let g:go_auto_sameids = 0

" Gofmt show errors on save?
let g:go_fmt_fail_silently = 0
" Automatically get signature / type infor for object under cursor.
let g:go_auto_type_info = 1
set updatetime=100

" Hightlighting
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0
let g:go_highlight_structs = 0
let g:go_highlight_generate_tags = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_textobj_include_function_doc = 0


map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" When calling :GoMetaLinter
" let g:go_metalinter_enabled = ['golint']

autocmd FileType go nmap <F5> <Plug>(go-vet)
autocmd FileType go nmap <F6> <Plug>(go-lint)
"
" Call on save
let g:go_metalinter_autosave = 0
" let g:go_metalinter_autosave_enabled = ['golint']
" let g:go_metalinter_deadline = "5s"
let g:go_metalinter_fail_silently = 1

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')


"*****************************************************************************
"" Alacritty support for mouse
"*****************************************************************************
" set ttymouse=sgr

"*****************************************************************************
"" Neovim-gtk
"*****************************************************************************
"Add these to ~/.zshenv for nvim-gtk environment variable support
set guicursor=


"*****************************************************************************
"" Nvim-lsp
"*****************************************************************************
" lua <<EOF
" require'lspconfig'.gopls.setup{
  " cmd = {"gopls", "serve"},
  " settings = {
    " gopls = {
      " analyses = {
        " unusedparams = true,
      " },
      " staticcheck = true,
    " },
  " },
" }
"
"
" require'lspconfig'.bashls.setup{}
" require'lspconfig'.html.setup{}
" require'lspconfig'.jedi_language_server.setup{}
" require'lspconfig'.jsonls.setup{}
" require'lspconfig'.tsserver.setup{}
" require'lspconfig'.vimls.setup{}
" require'lspconfig'.yamlls.setup{}
" EOF
"
"
"
"*****************************************************************************
"" Treesitter
"*****************************************************************************
"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
"
"*****************************************************************************
"" Barbar
"*****************************************************************************
" Magic buffer-picking mode
nnoremap <silent> gh :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> gd :BufferOrderByDirectory<CR>
nnoremap <silent> gl :BufferOrderByLanguage<CR>
" Move to previous/next
" nnoremap <silent>    gj :BufferPrevious<CR>
" nnoremap <silent>    gk :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    gJ :BufferMovePrevious<CR>
nnoremap <silent>    gK :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    gj :BufferGoto 1<CR>
nnoremap <silent>    gk :BufferGoto 2<CR>
nnoremap <silent>    gl :BufferGoto 3<CR>
nnoremap <silent>    g; :BufferGoto 4<CR>
nnoremap <silent>    g' :BufferGoto 5<CR>
nnoremap <silent>    ga :BufferGoto 6<CR>
nnoremap <silent>    gs :BufferGoto 7<CR>
nnoremap <silent>    gd :BufferGoto 8<CR>
nnoremap <silent>    gt :BufferLast<CR>
" Close buffer
nnoremap <silent>    gw :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
"
"
" EOF