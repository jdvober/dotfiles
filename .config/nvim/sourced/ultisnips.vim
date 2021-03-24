
"  /$$   /$$ /$$   /$$     /$$                     /$$                    
" | $$  | $$| $$  | $$    |__/                    |__/                    
" | $$  | $$| $$ /$$$$$$   /$$  /$$$$$$$ /$$$$$$$  /$$  /$$$$$$   /$$$$$$$
" | $$  | $$| $$|_  $$_/  | $$ /$$_____/| $$__  $$| $$ /$$__  $$ /$$_____/
" | $$  | $$| $$  | $$    | $$|  $$$$$$ | $$  \ $$| $$| $$  \ $$|  $$$$$$ 
" | $$  | $$| $$  | $$ /$$| $$ \____  $$| $$  | $$| $$| $$  | $$ \____  $$
" |  $$$$$$/| $$  |  $$$$/| $$ /$$$$$$$/| $$  | $$| $$| $$$$$$$/ /$$$$$$$/
"  \______/ |__/   \___/  |__/|_______/ |__/  |__/|__/| $$____/ |_______/ 
"                                                     | $$                
"                                                     | $$                
"                                                     |__/                
" 


"*****************************************************************************
" Pynvim needs to be installed to use.  Please see :help provider-python for details.  Also, running :checkhealth will be useful if you run into problems.
"*****************************************************************************

if LINUX()

let g:UltiSnipsExpandTrigger = '<C-f>'
let g:UltiSnipsJumpForwardTrigger = '<C-f>'
let g:UltiSnipsJumpBackwardTrigger = '<C-S-f>'
let g:UltiSnipsEditSplit="tabdo"

endif
