"  /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$
" |______/|______/|______/|______/|______/|______/|______/|______/
"  /$$      /$$                                                   
" | $$$    /$$$                                                   
" | $$$$  /$$$$  /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$$ 
" | $$ $$/$$ $$ |____  $$ /$$_____/ /$$__  $$ /$$__  $$ /$$_____/ 
" | $$  $$$| $$  /$$$$$$$| $$      | $$  \__/| $$  \ $$|  $$$$$$  
" | $$\  $ | $$ /$$__  $$| $$      | $$      | $$  | $$ \____  $$ 
" | $$ \/  | $$|  $$$$$$$|  $$$$$$$| $$      |  $$$$$$/ /$$$$$$$/ 
" |__/     |__/ \_______/ \_______/|__/       \______/ |_______/  
"  /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$
" |______/|______/|______/|______/|______/|______/|______/|______/
"
"
" =================================================================
" Marvim - https://github.com/chamindra/marvim
" =================================================================
"
" Default Hotkeys
" <F2>        - Find and execute a macro or insert template from repository
" Visual <F2> - Replays last macro for each line selected
" <F3>        - Save default macro register by name to the macro repository
" Visual <F3> - Save selection as template by name to the macro repository
" <Tab>       - On the Macro command line for cycling through autocomplete
" <Control>+D - On the Macro command line for listing autocomplete options
"
" =================================================================
" Change the default store location
" =================================================================

let g:marvim_store = '/home/jdv/github.com/jdvober/dotfiles/.config/nvim'

" =================================================================
" Change the default Store Key (stores macro in register q)
" =================================================================

let g:marvim_store_key = '<localleader>M'     " change store key from <F3> to 'Space-M'

" =================================================================
" Change the default Use Key
" =================================================================

let g:marvim_find_key = '<localleader>m' " change find key from <F2> to 'Space-m'


