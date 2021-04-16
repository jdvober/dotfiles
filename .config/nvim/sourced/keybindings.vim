

"  /$$   /$$                     /$$       /$$                 /$$ /$$                              
" | $$  /$$/                    | $$      |__/                | $$|__/                              
" | $$ /$$/   /$$$$$$  /$$   /$$| $$$$$$$  /$$ /$$$$$$$   /$$$$$$$ /$$ /$$$$$$$   /$$$$$$   /$$$$$$$
" | $$$$$/   /$$__  $$| $$  | $$| $$__  $$| $$| $$__  $$ /$$__  $$| $$| $$__  $$ /$$__  $$ /$$_____/
" | $$  $$  | $$$$$$$$| $$  | $$| $$  \ $$| $$| $$  \ $$| $$  | $$| $$| $$  \ $$| $$  \ $$|  $$$$$$ 
" | $$\  $$ | $$_____/| $$  | $$| $$  | $$| $$| $$  | $$| $$  | $$| $$| $$  | $$| $$  | $$ \____  $$
" | $$ \  $$|  $$$$$$$|  $$$$$$$| $$$$$$$/| $$| $$  | $$|  $$$$$$$| $$| $$  | $$|  $$$$$$$ /$$$$$$$/
" |__/  \__/ \_______/ \____  $$|_______/ |__/|__/  |__/ \_______/|__/|__/  |__/ \____  $$|_______/ 
"                      /$$  | $$                                                 /$$  \ $$          
"                     |  $$$$$$/                                                |  $$$$$$/          
"                      \______/                                                  \______/           



" ================================================================================
" Set leader to ','
" ================================================================================

let mapleader=','

" ================================================================================
" Remap W and E for backwards versions of w and e, respectively.
" ================================================================================

nnoremap W b
vnoremap W b
nnoremap E ge
vnoremap E ge

" ================================================================================
" jj or jk exits insert mode
" ================================================================================

inoremap jj <Esc>
inoremap jk <Esc>

" ================================================================================
" Used for moving one space in insert mode
" ================================================================================

inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" ================================================================================
" Paste on line below / line above
" ================================================================================

" Remove default binding for P first
map P <Nop>
	" Put above
nnoremap <silent> Pk [p
nnoremap <silent> PP [p
nnoremap <silent> Pp [p " to protect against early shift release

	" Put below
nnoremap <silent> Pj ]p
nnoremap <silent> P; ]p
nnoremap <silent> P: ]p " to protect against early shift release

" ================================================================================
" " Experimentally putting characters on/near home row with <C- >
" ================================================================================
"
" " Home
" inoremap <silent> <C-g> 0
" nnoremap <silent> <C-g> 0
" vnoremap <silent> <C-g> 0
"
" " First Character
" inoremap <silent> <C-h> ^
" nnoremap <silent> <C-h> ^
" vnoremap <silent> <C-h> ^
"
" " End
" inoremap <silent> <C-l> $
" nnoremap <silent> <C-l> $
" vnoremap <silent> <C-l> $
"
" " Left Paren
" inoremap <silent> <C-j> ()<C-o>i
" nnoremap <silent> <C-j> (
" vnoremap <silent> <C-j> (
"
" " Left Curly Brace
" inoremap <silent> <C-k> {}<C-o>i
" nnoremap <silent> <C-k> {
" vnoremap <silent> <C-k> {
"
" " Percent
" inoremap <silent> <C-n> %
" nnoremap <silent> <C-n> %
" vnoremap <silent> <C-n> %
"
" " Backtick
" inoremap <silent> <C-'> `
" nnoremap <silent> <C-'> `
" vnoremap <silent> <C-'> `
"
" " Equals
" inoremap <silent> <C-e> =
" nnoremap <silent> <C-e> =
" vnoremap <silent> <C-e> =
"
" onoremap <silent> t$ $
" ================================================================================
" Center line in middle of screen while in insert mode
" ================================================================================

inoremap <silent> zz <C-o>zz

" ================================================================================
" Move line to middle of screen
" ================================================================================

nnoremap <silent> zl zz

" ================================================================================
" Move line to top of screen
"*****************************************************************************

nnoremap <silent> zk zt2k2j

"*****************************************************************************
" Move line to bottom of screen
"*****************************************************************************

nnoremap <silent> zj zb2j2k

"*****************************************************************************
" Select All
"*****************************************************************************

nnoremap <silent> <C-a> ggVG

" ================================================================================
" Spaces to Tabs
" ================================================================================

" Four spaces -> tab
nnoremap <silent> <leader><leader>t mm:%%!unexpand -t 4 --first-only<CR><localleader><Tab>'m
" Two spaces -> tab
nnoremap <silent> <leader><leader>t :%%!unexpand -t 2 --first-only<CR>

" ================================================================================
" Quick re-select of last visual mode
" ================================================================================
nnoremap <silent> vv gv

" ================================================================================
" Unbinding the mouse
" ================================================================================

set mouse=a
map <LeftMouse> <NOP>
map <RightMouse> <NOP>


" ================================================================================
" Remaping Pgup Pgdn
" ================================================================================

map <silent> <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <silent> <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>


" ================================================================================
" This unsets the "last search pattern" register by hitting return
" ================================================================================

nnoremap <silent> <Esc> :noh<CR><Esc>
" nnoremap <silent> <CR> :noh<CR><CR>
nnoremap <silent> <CR> :noh<CR>

" ================================================================================
" Find and Replace
" ================================================================================
nnoremap ? :%s/
vnoremap ? :s/

" ================================================================================
" Indenting
" ================================================================================

" Tab / Shift-Tab in visual mode
" gv selects the last visual block, so after tabbing, the content is still
" selected
vmap <Tab> >gv
vmap <S-Tab> <gv

" Tab / Shift tab in normal mode (remembers cursor position with marks)
nnoremap <silent> <Tab> mm>i}'m
nnoremap <silent> <S-Tab> mm<i}'m

" ================================================================================
" Quick Surrounding
" ================================================================================
"
"Don't forget:
"cs  ...  change surround
"ds  ...  delete surround
"yss ...  surround entire line

" Surround with "..."
nnoremap S" g@iw"
nnoremap S' g@iw'

" Surround with {...}
nnoremap S{ g@iw{

" Surround with 
"{ 
"...
"}
nnoremap S} g@iw}

" Surround with (...)
nnoremap S( g@iw(

" Surround with ( ... )
nnoremap S) g@iw)

" Surround with [...]
nnoremap S[ g@iw[

" Surround with [ ... ]
nnoremap S] g@iw]

" Surround with <div>...</div>
nnoremap S<d g@iw<div><CR>


" ================================================================================
" VSCode Calls
" ================================================================================
"
if exists('g:vscode')
	" Open Files Dialog
	noremap <silent> :O <Cmd>call VSCodeNotify('workbench.action.files.openFile')<CR>
	nnoremap <silent> :o <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
	
	" Swith to different tabs
	nnoremap <silent> <leader>0 <Cmd>call VSCodeNotify('workbench.action.openLastEditorInGroup')<CR>
	nnoremap <silent> <leader>1 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
	nnoremap <silent> <leader>2 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
	nnoremap <silent> <leader>3 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
	nnoremap <silent> <leader>4 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
	nnoremap <silent> <leader>5 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
	nnoremap <silent> <leader>6 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
	nnoremap <silent> <leader>7 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
	nnoremap <silent> <leader>8 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
	nnoremap <silent> <leader>9 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex9')<CR>
endif
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
