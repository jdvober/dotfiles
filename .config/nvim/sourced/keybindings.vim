

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
let maplocalleader=' '

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
" Paste on line below / line above
" ================================================================================

" Remove default binding for P first
map P <Nop>
	" Put above
nnoremap <silent> Pk [p
nnoremap <silent> PK O<esc>[p

	" Put below
nnoremap <silent> Pj ]p
nnoremap <silent> PJ o<esc>]p

	" Put at end
nnoremap <silent> PL $p
nnoremap <silent> Pl $p " to protect against early shift release

	" Put at beginning

	" Copy most recent yank into register a, then append the contents of the current line to register a, and paster register a over the line
nnoremap <silent> PH :let @a=@0<CR>^y$:let @A=@0<CR>^v$"ap
nnoremap <silent> Ph :let @a=@0<CR>^y$:let @A=@0<CR>^v$"ap
" to protect against early shift release

" ================================================================================
" Move by code blocks
" ================================================================================

nnoremap J }
vnoremap J }
nnoremap K {
vnoremap K {

" ================================================================================
" Move to beginning / end of line
" ================================================================================

nnoremap H ^
vnoremap H ^

nnoremap L $
vnoremap L $

inoremap qm =

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


" ================================================================================
" Spaces to Tabs
" ================================================================================

" Four spaces -> tab
nnoremap <silent> <leader><leader>t mm:%%!unexpand -t 4 --first-only<CR>
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

" I think this makes more sense for decrementing
nnoremap <C-z> <C-x>

" ================================================================================
" VSCode Calls
" ================================================================================
"
if exists('g:vscode')
	" IF IN VSCODE
	
	" Open Files Dialog
	noremap <silent> <localleader>O <Cmd>call VSCodeNotify('workbench.action.files.openFile')<CR>
	nnoremap <silent> <localleader>o <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
	nnoremap <silent> <localleader>R <Cmd>call VSCodeNotify('workbench.action.openRecent')<CR>
	
	" File Explorer
	nnoremap <silent> <localleader>F <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
	
	" Rename
	nnoremap <silent> <localleader>r <Cmd>call VSCodeNotify('editor.action.rename')<CR>

	" Errors
	nnoremap <silent> <localleader>e <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
	nnoremap <silent> <localleader>E <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>

	" Close overlays
	nnoremap <silent> <localleader>w <Cmd>call VSCodeNotify('closeMarkersNavigation')<CR>
	
	" Swith to different tabs
	nnoremap <silent> <leader>0 <Cmd>call VSCodeNotify('workbench.action.openLastEditorInGroup')<CR>
	nnoremap <silent> <leader>1 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
	nnoremap <silent> <space>a <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
	nnoremap <silent> <leader>2 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
	nnoremap <silent> <space>s <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
	nnoremap <silent> <leader>3 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
	nnoremap <silent> <space>d <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
	nnoremap <silent> <leader>4 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
	nnoremap <silent> <space>f <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
	nnoremap <silent> <leader>5 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
	nnoremap <silent> <space>z <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
	nnoremap <silent> <leader>6 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
	nnoremap <silent> <space>x <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
	nnoremap <silent> <leader>7 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
	nnoremap <silent> <space>c <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
	nnoremap <silent> <leader>8 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
	nnoremap <silent> <space>v <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
	nnoremap <silent> <leader>9 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex9')<CR>
	
	" Splits
	nnoremap <localleader>WL <Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>
	nnoremap <localleader>WJ <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
	nnoremap <localleader>WK <Cmd>call VSCodeNotify('workbench.action.splitEditorOrthogonal')<CR>
	
	" Find word under cursor in files
nnoremap <silent> <localleader>/ <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
	"*****************************************************************************
	" Select All
	"*****************************************************************************

	nnoremap <silent> <C-S-a> <Cmd>call VSCodeNotify('editor.action.selectAll')
	
else
	" IF NOT IN VSCODE	
	
	nnoremap <silent> <C-S-a> m]ggVG']

endif

"
