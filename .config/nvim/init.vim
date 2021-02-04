" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
" Plugins
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
" let g:livepreview_previewer = 'evince'
let g:livepreview_previewer = 'okular'


Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'justinmk/vim-sneak'
    let g:sneak#label = 1
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
Plug 'asvetliakov/vim-easymotion'
    let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    map S <Plug>(easymotion-overwin-f)
    map s <Plug>(easymotion-overwin-f)

    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    " nmap s <Plug>(easymotion-overwin-f2)

    " Turn on case-insensitive feature
    let g:EasyMotion_smartcase = 1

    " JK motions: Line motions
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'inkarkat/vim-ReplaceWithRegister' " Makes gr Replace existing text with the contents of a register


" Terminal-only plugins
" Plug 'tmsvg/pear-tree'
Plug 'scrooloose/nerdcommenter'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'akinsho/nvim-bufferline.lua'
    " See bufferline section for config
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
    " See Language Server section for config
Plug 'glepnir/lspsaga.nvim'
" Plug 'nvim-lua/completion-nvim'
    " See Completion-nvim section for config
Plug 'hrsh7th/nvim-compe'
Plug 'cohama/lexima.vim'
    " To play nice with nvim-compe
    inoremap <silent><expr> <C-Space> compe#complete()
    inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
    inoremap <silent><expr> <C-e>     compe#close('<C-e>')

call plug#end()
" Required
filetype plugin indent on

"*****************************************************************************
" Basic Setup
"*****************************************************************************
" Auto-reload init.vim of change
au BufWritePost ~/.config/nvim/init.vim so $MYVIMRC

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Fix copy/paste?
set clipboard+=unnamedplus

" Tabs. May be overridden by autocmd rules
set tabstop=4
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

set termguicolors

"*****************************************************************************
" Keybindings Remap
"*****************************************************************************
" Set leader to ','
let mapleader=','
" Set localleader to Space (used for WhichKey)
let g:maplocalleader = "\<Space>"

" Remap W and E for backwards versions of w and e, respectively.
nnoremap W b
nnoremap E ge
inoremap jj <Esc>
" used for moving one space in insert mode
inoremap qh <C-o>h
inoremap qj <C-o>j
inoremap qk <C-o>k
inoremap ql <C-o>l
" used for breaking out of brackets
inoremap qa <Esc>la

" paste on line below / line above
nnoremap <silent> <leader>p ]p
nnoremap <silent> <leader>P [p

" For support of figures from Inkscape in LaTeX documents
" inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
inoremap <C-f> <Esc>: silent exec '.!python3 ~/.local/bin/inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!python3 ~/.local/bin/inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
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


" Custom Highlight Groups - https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
" Must be before colorscheme
" :highlight to see highlight groups
function! MyHighlights() abort
    highlight Search     cterm=bold,italic ctermfg=215 gui=bold,italic guifg=#FFB86C guibg=#21222C
    highlight PmenuSel   ctermbg=11 ctermfg=84 guifg=#50FA7B guibg=#191A21
    highlight Sneak      ctermfg=215 gui=bold,italic guifg=#FFB86C
    highlight SneakLabel cterm=bold,italic ctermfg=215 gui=bold,italic guifg=#FFB86C

endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme dracula

"*****************************************************************************
" Completion-nvim (terminal only!)
"*****************************************************************************
" " Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()
"
" " Use control space for manual popup
" " imap <silent> <C-Space> <Plug>(completion_trigger)
" imap <silent> <C-Space> :CompletionToggle
"
" " Popup Menu Navigation
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" " You can specify a list of matching strategy, completion-nvim will loop through the list and assign priority from high to low.
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
"
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
"
" " Avoid showing message extra message when using completion
" set shortmess+=c
"
" " Ultisnip Support
" let g:completion_enable_snippet = 'UltiSnips'
"
" " Add trigger characters
" let g:completion_trigger_character = ['.', '::']

"*****************************************************************************
" Compe (terminal only!)
"*****************************************************************************
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.allow_prefix_unmatch = v:false

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.your_awesome_source = {}
"*****************************************************************************
" Vim Airline (terminal only!)
"*****************************************************************************
let g:airline_theme='dracula'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 0
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
" GUI Options (terminal only!)
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
" Whichkey (terminal only!)
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
let g:which_key_map['w'] = {
      \ 'name' : '+Tabs, +Windows and +Buffers' ,
      \ 'c' : [':clo'        , 'close window']        ,
      \ 'j' : ['<C-W>j'        , 'Move to window below']        ,
      \ 'k' : ['<C-W>k'        , 'Move to window above']        ,
      \ 'l' : ['<C-W>l'        , 'Move to window to right']        ,
      \ 'h' : ['<C-W>h'        , 'Move to window to left']        ,
      \ 'H' : ['hsplit'        , 'split window horizontal']        ,
      \ 'L' : {
            \ 'name': '+list',
            \ 'b' : ['Buffers'     , 'buffers']      ,
            \ 't' : ['tabs' , 'tabs'] ,
            \ 'w' : ['Windows' , 'windows']  ,
            \ },
      \ 'v' : ['vsplit'        , 'split window vertical']        ,
      \ 'w' : ['bd'        , 'close Buffer']        ,
      \ }

let g:which_key_map['Tab'] = { 'name' : 'Pick Buffer' }
nnoremap <silent> <localleader><Tab> :BufferLinePick<CR>

let g:which_key_map['p'] = { 'name' : 'put on line below' }
" paste on line below / line above
nnoremap <silent> <localleader>p ]p
nnoremap <silent> <localleader>P [p


let g:which_key_map['R'] = { 'name' : 'source %' }
nnoremap <silent> <localleader>R :source %<CR>

let g:which_key_map['g'] = {
      \ 'name' : '+Golang' ,
      \ 'r' : [':!go run %'        , 'Go Run this file']        ,
      \ 'i' : ['GoImports'        , 'Fix Imports']        ,
      \ 'l' : ['GoDecls'        , 'List func declarations']        ,
      \ 'f' : ['GoFmt'        , 'GoFmt']        ,
      \ 'b' : ['GoBuild'        , 'GoBuild']        ,
      \ 'd' : ['GoDef'        , 'GoDef']        ,
      \ 'v' : ['GoVet'        , 'GoVet error checking']        ,
      \ 'a' : ['GoAddTags'        , 'GoAddTags']        ,
      \ }

let g:which_key_map['s'] = {
      \ 'name' : '+Snippets & +Macros' ,
      \ 'v' : ['Snippets'        , 'View Snippets']        ,
      \ 'e' : ['UltiSnipsEdit'        , 'Edit Snippets']        ,
      \ 'l' : {
            \ 'name': '+LaTeX',
            \ 'c' : {
                  \ 'name': '+\textcolor{}',
                  \ 'x' : ['ciw \\textcolor{}jjpysiw}hi'        , 'BLANK']        ,
                  \ 'd' : ['ciw \\textbf{\\textcolor{def}jjpysiw}f}a}jjhi'        , 'definition']        ,
                  \ 'f' : ['ciw \\textbf{\\textcolor{form}jjpysiw}f}a}jjhi'        , 'formula']        ,
                  \ 'u' : ['ciw \\textbf{\\textcolor{units}jjpysiw}f}a}jjhi'        , 'units']        ,
                  \ '1' : ['ciw \\textbf{\\textcolor{var1}jjpysiw}f}a}jjhi'        , 'var1']        ,
                  \ '2' : ['ciw \\textbf{\\textcolor{var2}jjpysiw}f}a}jjhi'        , 'var2']        ,
                  \ '3' : ['ciw \\textbf{\\textcolor{var3}jjpysiw}f}a}jjhi'        , 'var3']        ,
                  \ '4' : ['ciw \\textbf{\\textcolor{var4}jjpysiw}f}a}jjhi'        , 'var4']        ,
                  \ '5' : ['ciw \\textbf{\\textcolor{var5}jjpysiw}f}a}jjhi'        , 'var5']        ,
                  \ '6' : ['ciw \\textbf{\\textcolor{var6}jjpysiw}f}a}jjhi'        , 'var6']        ,
            \ },
            \ 't' : ['ciw\\textjjpysiw}hi'        , '\text']        ,
            \ 'e' : ['ciw\\begin{center}jjojjpI\tjjo\\end{center}'        , 'center']        ,
            \ },
      \ }

let g:which_key_map['f'] = {
      \ 'name' : '+file' ,
      \ 'f' : ['Files'        , 'Open via FZF']        ,
      \ 'o' : [':History!<CR>'        , 'Open Recent']        ,
      \ 'd' : ['Files'        , 'Open in current directory']        ,
      \ 'w' : [':w !sudo tee %'        , 'Sudo Save (Read-Only Override)']        ,
      \ 'i' : [':e $MYVIMRC'        , 'open init.vim']        ,
      \ 'q' : [':e /home/jdv/github.com/jdvober/dotfiles/.config/qtile/config.py'        , 'open qtile config']        ,
      \ 'z' : [':e /home/jdv/github.com/jdvober/dotfiles/.config/.zshrc'        , 'open zshrc']        ,
      \ 's' : [':setlocal spell'        , 'turn on spell check']        ,
      \ }
nnoremap <localleader>fe :edit
nnoremap <silent> <localleader>fn :enew<CR>

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
      \ 'C' : 'which_key_ignore'        ,
      \ 'G' : 'which_key_ignore'        ,
      \ 'g' : 'which_key_ignore'        ,
      \ 'I' : 'which_key_ignore'        ,
      \ 'K' : 'which_key_ignore'        ,
      \ 'L' : 'which_key_ignore'        ,
      \ 'l' : 'which_key_ignore'        ,
      \ 'q' : 'which_key_ignore'        ,
      \ 'T' : 'which_key_ignore'        ,
      \ 't' : 'which_key_ignore'        ,
      \ 'X' : 'which_key_ignore'        ,
      \ 'x' : 'which_key_ignore'        ,
      \ 'm' : 'which_key_ignore'        ,
      \ 'c' : ['VimtexCompile'        , 'compile']        ,
      \ 'v' : ['VimtexView'        , 'view']        ,
      \ 'p' : ['LLPStartPreview'        , 'Present (view live)']        ,
      \ 'r' : ['VimtexReload'        , 'reload']        ,
      \ 'k' : ['VimtexStop'        , 'stop']        ,
      \ 'i' : ['VimtexInfo'        , 'info']        ,
      \ 's' : ['VimtexCompileSelected'        , 'compile selected']        ,
      \ 'e' : ['VimtexErrors'        , 'errors']        ,
      \ 'o' : ['VimtexLog'        , 'log']        ,
      \ 'w' : ['!inkscape-figures watch'        , 'Watch for inkscape figures']        ,
      \ }

"*****************************************************************************
" Language Servers (terminal only!)
"*****************************************************************************
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
    "*****************************************************************************
    " Go
    "*****************************************************************************
lua << EOF
lspconfig = require "lspconfig"
-- if using completion-nvim
-- lspconfig.gopls.setup{on_attach=require'completion'.on_attach}
lspconfig.gopls.setup{}
-- lspconfig.gopls.setup {
--   cmd = {"gopls", "serve"},
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
-- }

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local method = "textDocument/codeAction"
  local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
  if resp and resp[1] then
    local result = resp[1].result
    if result and result[1] then
      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end

  vim.lsp.buf.formatting()
end
EOF
autocmd BufWritePre *.go lua goimports(1000)
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc


"*****************************************************************************
" Lspsaga (terminal only!)
"*****************************************************************************
lua << EOF
local saga = require 'lspsaga'

-- add your config value here
-- default value
-- use_saga_diagnostic_handler = true
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- code_action_icon = ' ',
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- definition_preview_icon = '  '
-- 1: thin border | 2: rounded border | 3: thick border
-- border_style = 1
-- max_hover_width = 0 (automatically adjust to the width of current symbol)
-- rename_prompt_prefix = '➤',

-- saga.init_lsp_saga {
--   your custom option here
-- }

-- or --use default config
saga.init_lsp_saga()

EOF

" Hover Documentation
nnoremap <silent> <F1> <cmd>lua vim.lsp.buf.hover()<CR>
" Rename
nnoremap <silent> <F2> :LspSagaRename<CR>
" Find the cursor word definition and references
nnoremap <silent> <F3> :LspSagaFinder<CR>
" Preview Definition
nnoremap <silent> <F4> :LspSagaDefPreview<CR>
" Diagnostics
"
" -- show
" nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> <leader>cd :LspSagaShowLineDiags<CR>

" -- jump diagnostic
let g:which_key_map['e'] = { 'name' : 'Next Error' }
" nnoremap <silent> <localleader>e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
let g:which_key_map['E'] = { 'name' : 'Previous Error' }
" nnoremap <silent> <localleader>E <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" -- or use command
nnoremap <silent> [e :LspSagaDiagJumpPrev<CR>
nnoremap <silent> ]e :LspSagaDiagJumpNext<CR>


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
nnoremap <silent> <Esc> :noh<CR><Esc>
nnoremap <silent> <CR> :noh<CR><CR>

" Copy/Paste/Cut
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

"*****************************************************************************
" Bufferline
"*****************************************************************************
nnoremap <silent> <leader>` :BufferLineMoveNext<CR>
nnoremap <silent> <leader>~ :BufferLineMovePrev<CR>
lua << EOF
require'bufferline'.setup{
  options = {
    view = "multiwindow",
    numbers = "ordinal",
    number_style = "",
    mappings = true,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    show_buffer_close_icons = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'relative_directory'
  }
}
EOF
