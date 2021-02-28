
"   /$$$$$$  /$$           /$$ /$$                    
"  /$$__  $$|__/          | $$|__/                    
" | $$  \ $$ /$$  /$$$$$$ | $$ /$$ /$$$$$$$   /$$$$$$ 
" | $$$$$$$$| $$ /$$__  $$| $$| $$| $$__  $$ /$$__  $$
" | $$__  $$| $$| $$  \__/| $$| $$| $$  \ $$| $$$$$$$$
" | $$  | $$| $$| $$      | $$| $$| $$  | $$| $$_____/
" | $$  | $$| $$| $$      | $$| $$| $$  | $$|  $$$$$$$
" |__/  |__/|__/|__/      |__/|__/|__/  |__/ \_______/
                                                     

if !exists('g:vscode')

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

endif

endif
