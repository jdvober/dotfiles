
"  /$$$$$$$$                                      /$$   /$$     /$$                        
" |__  $$__/                                     |__/  | $$    | $$                        
"    | $$  /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$$ /$$ /$$$$$$ /$$$$$$    /$$$$$$   /$$$$$$ 
"    | $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$_____/| $$|_  $$_/|_  $$_/   /$$__  $$ /$$__  $$
"    | $$| $$  \__/| $$$$$$$$| $$$$$$$$|  $$$$$$ | $$  | $$    | $$    | $$$$$$$$| $$  \__/
"    | $$| $$      | $$_____/| $$_____/ \____  $$| $$  | $$ /$$| $$ /$$| $$_____/| $$      
"    | $$| $$      |  $$$$$$$|  $$$$$$$ /$$$$$$$/| $$  |  $$$$/|  $$$$/|  $$$$$$$| $$      
"    |__/|__/       \_______/ \_______/|_______/ |__/   \___/   \___/   \_______/|__/      
                                                                                          
 
if !exists('g:vscode')

lua <<EOF
require'nvim-treesitter.configs'.setup {
" highlight = {
  " enable = true,
  " custom_captures = {
    " -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    " ["foo.bar"] = "Identifier",
  " },
" },
" incremental_selection = {
  " enable = true,
  " keymaps = {
    " init_selection = "gnn",
    " node_incremental = "grn",
    " scope_incremental = "grc",
    " node_decremental = "grm",
  " },
" },
" indent = {
  " enable = true
" },
}
EOF

endif
