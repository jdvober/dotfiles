
"   /$$$$$$                                             
"  /$$__  $$                                            
" | $$  \__/  /$$$$$$  /$$$$$$/$$$$   /$$$$$$   /$$$$$$ 
" | $$       /$$__  $$| $$_  $$_  $$ /$$__  $$ /$$__  $$
" | $$      | $$  \ $$| $$ \ $$ \ $$| $$  \ $$| $$$$$$$$
" | $$    $$| $$  | $$| $$ | $$ | $$| $$  | $$| $$_____/
" |  $$$$$$/|  $$$$$$/| $$ | $$ | $$| $$$$$$$/|  $$$$$$$
"  \______/  \______/ |__/ |__/ |__/| $$____/  \_______/
"                                   | $$                
"                                   | $$                
"                                   |__/                
if !exists('g:vscode')


let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.allow_prefix_unmatch = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.vsnip = v:false
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.your_awesome_source = {}

lua << EOF
local t = function(str)
" return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  " local col = vim.fn.col('.') - 1
  " if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
  	" return true
  " else
  	" return false
  " end
end

EOF

endif
