" 
"     /$$$$$                           /$$    /$$          /$$                          /$$                              
"    |__  $$                          | $$   | $$         | $$                         | $/                              
"       | $$  /$$$$$$   /$$$$$$       | $$   | $$ /$$$$$$ | $$$$$$$   /$$$$$$   /$$$$$$|_//$$$$$$$                       
"       | $$ /$$__  $$ /$$__  $$      |  $$ / $$//$$__  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$_____/                       
"  /$$  | $$| $$  \ $$| $$$$$$$$       \  $$ $$/| $$  \ $$| $$  \ $$| $$$$$$$$| $$  \__/|  $$$$$$                        
" | $$  | $$| $$  | $$| $$_____/        \  $$$/ | $$  | $$| $$  | $$| $$_____/| $$       \____  $$                       
" |  $$$$$$/|  $$$$$$/|  $$$$$$$         \  $/  |  $$$$$$/| $$$$$$$/|  $$$$$$$| $$       /$$$$$$$/                       
"  \______/  \______/  \_______/          \_/    \______/ |_______/  \_______/|__/      |_______/                        
"  /$$   /$$                                /$$                      /$$$$$$                       /$$$$$$  /$$          
" | $$$ | $$                               |__/                     /$$__  $$                     /$$__  $$|__/          
" | $$$$| $$  /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$       | $$  \__/  /$$$$$$  /$$$$$$$ | $$  \__/ /$$  /$$$$$$ 
" | $$ $$ $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$      | $$       /$$__  $$| $$__  $$| $$$$    | $$ /$$__  $$
" | $$  $$$$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$      | $$      | $$  \ $$| $$  \ $$| $$_/    | $$| $$  \ $$
" | $$\  $$$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$      | $$    $$| $$  | $$| $$  | $$| $$      | $$| $$  | $$
" | $$ \  $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$      |  $$$$$$/|  $$$$$$/| $$  | $$| $$      | $$|  $$$$$$$
" |__/  \__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/       \______/  \______/ |__/  |__/|__/      |__/ \____  $$
"                                                                                                               /$$  \ $$
"                                                                                                              |  $$$$$$/
"                                                                                                               \______/ 

" ================================================================================
" Sourcing files (order matters!)
"
" Use gf to open the config file for a particular plugin
" ================================================================================

	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/platform.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/plugins.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/basic.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/keybindings.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/keybindings_vscode.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/nerd-commenter.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/sneak.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/easymotion.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/ultisnips.vim

" ================================================================================
" Terminal Only Plugins
" ================================================================================

if !exists('g:vscode')
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/highlight.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/fzf.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/airline.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/bufferline.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/startify.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/netrw.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/session.vim
	source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/lexima.vim
endif

" ================================================================================
" Disabled Plugins
" ================================================================================

" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/which-key.vim
" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/coc.vim
" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/treesitter.vim
" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/vim-rainbow.vim
" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/lspsaga.vim
" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/completion-nvim.vim
" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/compe.vim
" source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/language-servers.vim


"  /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$                                
" |______/|______/|______/|______/|______/|______/                                
"  /$$   /$$             /$$                                                      
" | $$$ | $$            | $$                                                      
" | $$$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$$                              
" | $$ $$ $$ /$$__  $$|_  $$_/   /$$__  $$ /$$_____/                              
" | $$  $$$$| $$  \ $$  | $$    | $$$$$$$$|  $$$$$$                               
" | $$\  $$$| $$  | $$  | $$ /$$| $$_____/ \____  $$                              
" | $$ \  $$|  $$$$$$/  |  $$$$/|  $$$$$$$ /$$$$$$$/                              
" |__/  \__/ \______/    \___/   \_______/|_______/                               
"  /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$                                
" |______/|______/|______/|______/|______/|______/                                
"                                                                                 

" ================================================================================
" Filetype Specific Formatting
" ================================================================================
" Create a filetype plugin in /ftplugin.
" To see a list of filetypes, use :setfiletype CTRL-D


" ================================================================================
" Embedding in VSCode
" ================================================================================

" Some settings are only needed when running Neovim in a terminal.  They
" should be excluded when using the Neovim VSCode extension.
"
" To achieve this, wrap the settings in 

" if !exists('g:vscode')
"  // Your settings here
" endif


" ================================================================================
" Headers
" ================================================================================

" Headers are provided from http://www.patorjk.com/software/taag/#p=display&h=1&v=2&f=Big%20Money-ne&t=LaTeX




