
"  /$$$$$$$  /$$                     /$$                    
" | $$__  $$| $$                    |__/                    
" | $$  \ $$| $$ /$$   /$$  /$$$$$$  /$$ /$$$$$$$   /$$$$$$$
" | $$$$$$$/| $$| $$  | $$ /$$__  $$| $$| $$__  $$ /$$_____/
" | $$____/ | $$| $$  | $$| $$  \ $$| $$| $$  \ $$|  $$$$$$ 
" | $$      | $$| $$  | $$| $$  | $$| $$| $$  | $$ \____  $$
" | $$      | $$|  $$$$$$/|  $$$$$$$| $$| $$  | $$ /$$$$$$$/
" |__/      |__/ \______/  \____  $$|__/|__/  |__/|_______/ 
"                          /$$  \ $$                        
"                         |  $$$$$$/                        
"                          \______/                         
" 


"*****************************************************************************
" Required:
"*****************************************************************************

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'mhinz/vim-startify'
Plug 'fatih/vim-go', { 'do':':GoUpdateBinaries'}
" if LINUX()
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'KeitaNakamura/tex-conceal.vim'
" Plug 'sirver/ultisnips'
" endif
Plug 'justinmk/vim-sneak'
Plug 'asvetliakov/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'cohama/lexima.vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'hrsh7th/nvim-compe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'shmargum/vim-sass-colors'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()


"*****************************************************************************
" Required
"*****************************************************************************

filetype plugin indent on

