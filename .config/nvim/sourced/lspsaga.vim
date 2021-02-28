
"  /$$        /$$$$$$  /$$$$$$$   /$$$$$$                               
" | $$       /$$__  $$| $$__  $$ /$$__  $$                              
" | $$      | $$  \__/| $$  \ $$| $$  \__/  /$$$$$$   /$$$$$$   /$$$$$$ 
" | $$      |  $$$$$$ | $$$$$$$/|  $$$$$$  |____  $$ /$$__  $$ |____  $$
" | $$       \____  $$| $$____/  \____  $$  /$$$$$$$| $$  \ $$  /$$$$$$$
" | $$       /$$  \ $$| $$       /$$  \ $$ /$$__  $$| $$  | $$ /$$__  $$
" | $$$$$$$$|  $$$$$$/| $$      |  $$$$$$/|  $$$$$$$|  $$$$$$$|  $$$$$$$
" |________/ \______/ |__/       \______/  \_______/ \____  $$ \_______/
"                                                    /$$  \ $$          
"                                                   |  $$$$$$/          
"                                                    \______/           
 
if !exists('g:vscode')

lua << EOF
local saga = require 'lspsaga'

-- add your config value here
-- default value
-- use_saga_diagnostic_handler = true
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- code_action_icon = ' ',
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- definition_preview_icon = '  '
-- 1: thin border | 2: rounded border | 3: thick border
-- border_style = 1
-- max_hover_width = 0 (automatically adjust to the width of current symbol)
-- max_hover_width = 0 (automatically adjust to the width of current symbol)
-- rename_prompt_prefix = '➤',

-- saga.init_lsp_saga {
--   your custom option here
-- }

-- or --use default config
saga.init_lsp_saga()

EOF

" Hover Documentation
nnoremap <silent> <F1> <cmd>lua vim.lsp.buf.hover()<CR>
" Rename
nnoremap <silent> <F2> :LspSagaRename<CR>
" Find the cursor word definition and references
nnoremap <silent> <F3> :LspSagaFinder<CR>
" Preview Definition
nnoremap <silent> <F4> :LspSagaDefPreview<CR>
" Diagnostics
"
" -- show
" nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> <leader>cd :LspSagaShowLineDiags<CR>

" -- jump diagnostic
let g:which_key_map['e'] = { 'name' : 'Next Error' }
" nnoremap <silent> <localleader>e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
let g:which_key_map['E'] = { 'name' : 'Previous Error' }
" nnoremap <silent> <localleader>E <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" -- or use command
nnoremap <silent> [e :LspSagaDiagJumpPrev<CR>
nnoremap <silent> ]e :LspSagaDiagJumpNext<CR>

endif
