
"  /$$      /$$ /$$       /$$           /$$               /$$                          
" | $$  /$ | $$| $$      |__/          | $$              | $$                          
" | $$ /$$$| $$| $$$$$$$  /$$  /$$$$$$$| $$$$$$$         | $$   /$$  /$$$$$$  /$$   /$$
" | $$/$$ $$ $$| $$__  $$| $$ /$$_____/| $$__  $$ /$$$$$$| $$  /$$/ /$$__  $$| $$  | $$
" | $$$$_  $$$$| $$  \ $$| $$| $$      | $$  \ $$|______/| $$$$$$/ | $$$$$$$$| $$  | $$
" | $$$/ \  $$$| $$  | $$| $$| $$      | $$  | $$        | $$_  $$ | $$_____/| $$  | $$
" | $$/   \  $$| $$  | $$| $$|  $$$$$$$| $$  | $$        | $$ \  $$|  $$$$$$$|  $$$$$$$
" |__/     \__/|__/  |__/|__/ \_______/|__/  |__/        |__/  \__/ \_______/ \____  $$
"                                                                             /$$  | $$
"                                                                            |  $$$$$$/
"                                                                             \______/ 


if !exists('g:vscode')

	
" ================================================================================
" Set localleader to Space (used for WhichKey)
" ================================================================================
let g:maplocalleader = "\<Space>"

" ============================================================================*
" My Whichkey setup is only set to utilize the localldeader which is bound to
" space
" ============================================================================*

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" ============================================================================*
" The next step is to add items to g:which_key_map:
" ============================================================================*

" Define prefix dictionary
let g:which_key_map =  {}

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
" and descriptions for the existing mappings.
"

" ============================================================================*
" Mappings to hide from top level menu.  If you decide to rebind these, you
" must delete from this list:
" ============================================================================*

let g:which_key_map.p = 'which_key_ignore'
let g:which_key_map.j = 'which_key_ignore'
let g:which_key_map.k = 'which_key_ignore'

" ============================================================================*
" Note:
" Some complicated ex-cmd may not work as expected since they'll be feed into `feedkeys()`, in which case you have to define a decicated
" Command or function wrapper to make it work with vim-which-key.
" Ref issue #126, #133 etc.
" ============================================================================*

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

let g:which_key_map['Tab'] = { 'name' : 'Fix Indentation' }
nnoremap <silent> <localleader><Tab> mmgg=G'm


" ============================================================================*
" Paste on line below / line above
" ============================================================================*

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
	\ 'c' : {
				\ 'name': '+GoAddTags',
				\ 'j' : [':GoAddTags json']        ,
				\ 'b' : [':GoAddTags bson']        ,
			\ },
	\ }

let g:which_key_map['s'] = {
	\ 'name' : '+Snippets' ,
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
	\ 'o' : ['FZF'        , 'Open']        ,
	\ 'r' : [':History!<CR>'        , 'Recent']        ,
	\ 'd' : ['FZF'        , 'Open in current directory']        ,
	\ 'w' : [':w !sudo tee %'        , 'Sudo Save (Read-Only Override)']        ,
	\ 'i' : [':e $MYVIMRC'        , 'open init.vim']        ,
	\ 'k' : [':e ~/github.com/jdvober/dotfiles.config/nvim/sourced/keybindings.vim'        , 'open keybindings.vim']        ,
	\ 'q' : [':e /home/jdv/github.com/jdvober/dotfiles/.config/qtile/config.py'        , 'open qtile config']        ,
	\ 'z' : [':e /home/jdv/github.com/jdvober/dotfiles/.config/.zshrc'        , 'open zshrc']        ,
	\ 's' : [':setlocal spell'        , 'turn on spell check']        ,
	\ }
nnoremap <localleader>fe :edit /
nnoremap <silent> <localleader>fn :enew<CR>

let g:which_key_map['/'] = {
	\ 'name' : '+Search' ,
	\ '?' : ['Windows!'    , 'fzf-window']            ,
	\ 'd' : ['Files'        , 'Search in all files in ./']        ,
	\ 'a' : ['Rg'        , 'Search in all files with ripgrep']        ,
	\ 'l' : ['BLines'        , 'Search in current buffer']        ,
	\ 'b' : ['Buffers'        , 'Search in all buffers']        ,
	\ }
nnoremap <silent> <localleader>/r :%s/
vnoremap / :%s/\%V

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

let g:which_key_map['S'] = {
	\ 'name' : '+Visual Surround' ,
	\ 'd' : ['S<div>'        , '<div>']        ,
	\ '"' : ['S"'        , '"..."']        ,
	\ '(' : ['S('        , '(...)']        ,
	\ ')' : ['S)'        , '( ... )']        ,
	\ '{' : ['S{'        , '(...)']        ,
	\ '}' : ['S}'        , '( ... )']        ,
	\ }
endif
