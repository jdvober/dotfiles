" /$$   /$$                     /$$       /$$                 /$$ /$$                              
"| $$  /$$/                    | $$      |__/                | $$|__/                              
"| $$ /$$/   /$$$$$$  /$$   /$$| $$$$$$$  /$$ /$$$$$$$   /$$$$$$$ /$$ /$$$$$$$   /$$$$$$   /$$$$$$$
"| $$$$$/   /$$__  $$| $$  | $$| $$__  $$| $$| $$__  $$ /$$__  $$| $$| $$__  $$ /$$__  $$ /$$_____/
"| $$  $$  | $$$$$$$$| $$  | $$| $$  \ $$| $$| $$  \ $$| $$  | $$| $$| $$  \ $$| $$  \ $$|  $$$$$$ 
"| $$\  $$ | $$_____/| $$  | $$| $$  | $$| $$| $$  | $$| $$  | $$| $$| $$  | $$| $$  | $$ \____  $$
"| $$ \  $$|  $$$$$$$|  $$$$$$$| $$$$$$$/| $$| $$  | $$|  $$$$$$$| $$| $$  | $$|  $$$$$$$ /$$$$$$$/
"|__/  \__/ \_______/ \____  $$|_______/ |__/|__/  |__/ \_______/|__/|__/  |__/ \____  $$|_______/ 
"                     /$$  | $$                                                 /$$  \ $$          
"                    |  $$$$$$/                                                |  $$$$$$/          
"                     \______/                                                  \______/           
" /$$    /$$  /$$$$$$   /$$$$$$                  /$$                                               
"| $$   | $$ /$$__  $$ /$$__  $$                | $$                                               
"| $$   | $$| $$  \__/| $$  \__/  /$$$$$$   /$$$$$$$  /$$$$$$                                      
"|  $$ / $$/|  $$$$$$ | $$       /$$__  $$ /$$__  $$ /$$__  $$                                     
" \  $$ $$/  \____  $$| $$      | $$  \ $$| $$  | $$| $$$$$$$$                                     
"  \  $$$/   /$$  \ $$| $$    $$| $$  | $$| $$  | $$| $$_____/                                     
"   \  $/   |  $$$$$$/|  $$$$$$/|  $$$$$$/|  $$$$$$$|  $$$$$$$                                     
"    \_/     \______/  \______/  \______/  \_______/ \_______/                                     
"                                                                                                  
                                                                                                  
                                                                  
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
	nnoremap <silent> <localleader>a <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
	nnoremap <silent> <leader>2 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
	nnoremap <silent> <localleader>s <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
	nnoremap <silent> <leader>3 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
	nnoremap <silent> <localleader>d <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
	nnoremap <silent> <leader>4 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
	nnoremap <silent> <localleader>f <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
	nnoremap <silent> <leader>5 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
	nnoremap <silent> <localleader>z <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
	nnoremap <silent> <leader>6 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
	nnoremap <silent> <localleader>x <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
	nnoremap <silent> <leader>7 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
	nnoremap <silent> <localleader>c <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
	nnoremap <silent> <leader>8 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
	nnoremap <silent> <localleader>v <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
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

	nnoremap <silent> <C-S-a>		<Cmd>call VSCodeNotify('editor.action.selectAll')
	nnoremap <silent> <localleader>A		<Cmd>call VSCodeNotify('editor.action.selectAll')


	"*****************************************************************************
	" File Manipulation
	"*****************************************************************************
	nnoremap <silent> <localleader>S		<Cmd>call VSCodeNotify('workbench.action.files.saveAs')<CR>
	nnoremap <silent> <localleader>N		<Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR>

else
	" IF NOT IN VSCODE	

	nnoremap <silent> <C-S-a> m]ggVG']

endif
