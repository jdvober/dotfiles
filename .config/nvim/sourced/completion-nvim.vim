
"   /$$$$$$                                    /$$             /$$     /$$                            
"  /$$__  $$                                  | $$            | $$    |__/                            
" | $$  \__/  /$$$$$$  /$$$$$$/$$$$   /$$$$$$ | $$  /$$$$$$  /$$$$$$   /$$  /$$$$$$  /$$$$$$$         
" | $$       /$$__  $$| $$_  $$_  $$ /$$__  $$| $$ /$$__  $$|_  $$_/  | $$ /$$__  $$| $$__  $$ /$$$$$$
" | $$      | $$  \ $$| $$ \ $$ \ $$| $$  \ $$| $$| $$$$$$$$  | $$    | $$| $$  \ $$| $$  \ $$|______/
" | $$    $$| $$  | $$| $$ | $$ | $$| $$  | $$| $$| $$_____/  | $$ /$$| $$| $$  | $$| $$  | $$        
" |  $$$$$$/|  $$$$$$/| $$ | $$ | $$| $$$$$$$/| $$|  $$$$$$$  |  $$$$/| $$|  $$$$$$/| $$  | $$        
"  \______/  \______/ |__/ |__/ |__/| $$____/ |__/ \_______/   \___/  |__/ \______/ |__/  |__/        
"                                   | $$                                                              
"                       /$$         | $$                                                              
"                      |__/         |__/                                                              
"  /$$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$                                                              
" | $$__  $$|  $$  /$$/| $$| $$_  $$_  $$                                                             
" | $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$                                                             
" | $$  | $$  \  $$$/  | $$| $$ | $$ | $$                                                             
" | $$  | $$   \  $/   | $$| $$ | $$ | $$                                                             
" |__/  |__/    \_/    |__/|__/ |__/ |__/                                                             
                                                                                                    
                                                                                                    
if !exists('g:vscode')

"*****************************************************************************
" Use completion-nvim in every buffer
"*****************************************************************************

autocmd BufEnter * lua require'completion'.on_attach()


"*****************************************************************************
" Use control space for manual popup
"*****************************************************************************

" imap <silent> <C-Space> <Plug>(completion_trigger)
imap <silent> <C-Space> :CompletionToggle


"*****************************************************************************
" Popup Menu Navigation
"*****************************************************************************

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


"*****************************************************************************
" You can specify a list of matching strategy, completion-nvim will loop through the list and assign priority from high to low.
"*****************************************************************************

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']


"*****************************************************************************
" Set completeopt to have a better completion experience
"*****************************************************************************

set completeopt=menuone,noinsert,noselect


"*****************************************************************************
" Avoid showing message extra message when using completion
"*****************************************************************************

set shortmess+=c

" Ultisnip Support
let g:completion_enable_snippet = 'UltiSnips'

" Add trigger characters
let g:completion_trigger_character = ['.', '::']

endif
