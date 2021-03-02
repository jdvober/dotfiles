
"  /$$              /$$$$$$$$        /$$   /$$
" | $$             |__  $$__/       | $$  / $$
" | $$        /$$$$$$ | $$  /$$$$$$ |  $$/ $$/
" | $$       |____  $$| $$ /$$__  $$ \  $$$$/ 
" | $$        /$$$$$$$| $$| $$$$$$$$  >$$  $$ 
" | $$       /$$__  $$| $$| $$_____/ /$$/\  $$
" | $$$$$$$$|  $$$$$$$| $$|  $$$$$$$| $$  \ $$
" |________/ \_______/|__/ \_______/|__/  |__/
"                                             
 
source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/vimtex.vim
source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/vim-latex-live-preview.vim
source ~/github.com/jdvober/dotfiles/.config/nvim/sourced/tex-conceal.vim

"*****************************************************************************
" For support of figures from Inkscape in LaTeX documents
"*****************************************************************************

" inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
inoremap <C-f> <Esc>: silent exec '.!python3 ~/.local/bin/inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!python3 ~/.local/bin/inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
