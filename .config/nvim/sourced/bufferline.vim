
"  /$$$$$$$             /$$$$$$   /$$$$$$                    /$$ /$$                    
" | $$__  $$           /$$__  $$ /$$__  $$                  | $$|__/                    
" | $$  \ $$ /$$   /$$| $$  \__/| $$  \__//$$$$$$   /$$$$$$ | $$ /$$ /$$$$$$$   /$$$$$$ 
" | $$$$$$$ | $$  | $$| $$$$    | $$$$   /$$__  $$ /$$__  $$| $$| $$| $$__  $$ /$$__  $$
" | $$__  $$| $$  | $$| $$_/    | $$_/  | $$$$$$$$| $$  \__/| $$| $$| $$  \ $$| $$$$$$$$
" | $$  \ $$| $$  | $$| $$      | $$    | $$_____/| $$      | $$| $$| $$  | $$| $$_____/
" | $$$$$$$/|  $$$$$$/| $$      | $$    |  $$$$$$$| $$      | $$| $$| $$  | $$|  $$$$$$$
" |_______/  \______/ |__/      |__/     \_______/|__/      |__/|__/|__/  |__/ \_______/
"                                                                                       
                                                                                       
 
" nnoremap <silent> <leader>` :BufferLineMoveNext<CR>
" nnoremap <silent> <leader>~ :BufferLineMovePrev<CR>
lua << EOF
require'bufferline'.setup{
  options = {
	view = "multiwindow",
	numbers = "ordinal",
	number_style = "",
	mappings = true,
	buffer_close_icon= '',
	modified_icon = '●',
	-- close_icon = '',
	left_trunc_marker = '',
	right_trunc_marker = '',
	max_name_length = 18,
	max_prefix_length = 15, -- prefix used when a buffer is deduplicated
	tab_size = 18,
	show_buffer_close_icons = true,
	persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
	-- can also be a table containing 2 custom separators
	-- [focused and unfocused]. eg: { '|', '|' }
	separator_style = "thin",
	enforce_regular_tabs = false,
	always_show_bufferline = true,
	sort_by = 'relative_directory'
  }
}
EOF
