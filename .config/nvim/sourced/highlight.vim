
"  /$$   /$$ /$$           /$$       /$$ /$$           /$$         /$$     /$$                    
" | $$  | $$|__/          | $$      | $$|__/          | $$        | $$    |__/                    
" | $$  | $$ /$$  /$$$$$$ | $$$$$$$ | $$ /$$  /$$$$$$ | $$$$$$$  /$$$$$$   /$$ /$$$$$$$   /$$$$$$ 
" | $$$$$$$$| $$ /$$__  $$| $$__  $$| $$| $$ /$$__  $$| $$__  $$|_  $$_/  | $$| $$__  $$ /$$__  $$
" | $$__  $$| $$| $$  \ $$| $$  \ $$| $$| $$| $$  \ $$| $$  \ $$  | $$    | $$| $$  \ $$| $$  \ $$
" | $$  | $$| $$| $$  | $$| $$  | $$| $$| $$| $$  | $$| $$  | $$  | $$ /$$| $$| $$  | $$| $$  | $$
" | $$  | $$| $$|  $$$$$$$| $$  | $$| $$| $$|  $$$$$$$| $$  | $$  |  $$$$/| $$| $$  | $$|  $$$$$$$
" |__/  |__/|__/ \____  $$|__/  |__/|__/|__/ \____  $$|__/  |__/   \___/  |__/|__/  |__/ \____  $$
"                /$$  \ $$                   /$$  \ $$                                   /$$  \ $$
"               |  $$$$$$/                  |  $$$$$$/                                  |  $$$$$$/
"                \______/                    \______/                                    \______/ 
"*****************************************************************************
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
" Must be before colorscheme
" :highlight to see highlight groups
"*****************************************************************************

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

" Highlight on yank duration
let g:highlightedyank_highlight_duration = 2500
