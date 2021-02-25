
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

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="tabdo"

endif
