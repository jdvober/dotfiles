 
 
"  /$$   /$$                     /$$       /$$                 /$$ /$$                              
" | $$  /$$/                    | $$      |__/                | $$|__/                              
" | $$ /$$/   /$$$$$$  /$$   /$$| $$$$$$$  /$$ /$$$$$$$   /$$$$$$$ /$$ /$$$$$$$   /$$$$$$   /$$$$$$$
" | $$$$$/   /$$__  $$| $$  | $$| $$__  $$| $$| $$__  $$ /$$__  $$| $$| $$__  $$ /$$__  $$ /$$_____/
" | $$  $$  | $$$$$$$$| $$  | $$| $$  \ $$| $$| $$  \ $$| $$  | $$| $$| $$  \ $$| $$  \ $$|  $$$$$$ 
" | $$\  $$ | $$_____/| $$  | $$| $$  | $$| $$| $$  | $$| $$  | $$| $$| $$  | $$| $$  | $$ \____  $$
" | $$ \  $$|  $$$$$$$|  $$$$$$$| $$$$$$$/| $$| $$  | $$|  $$$$$$$| $$| $$  | $$|  $$$$$$$ /$$$$$$$/
" |__/  \__/ \_______/ \____  $$|_______/ |__/|__/  |__/ \_______/|__/|__/  |__/ \____  $$|_______/ 
"                      /$$  | $$                                                 /$$  \ $$          
"                     |  $$$$$$/                                                |  $$$$$$/          
"                      \______/                                                  \______/           
 


"*****************************************************************************
" Set leader to ','
"*****************************************************************************

let mapleader=','

"*****************************************************************************
" Set localleader to Space (used for WhichKey)
"*****************************************************************************
let g:maplocalleader = "\<Space>"

"*****************************************************************************
" Remap W and E for backwards versions of w and e, respectively.
"*****************************************************************************

nnoremap W b
nnoremap E ge

"*****************************************************************************
" jj exits insert mode
"*****************************************************************************

inoremap jj <Esc>

"*****************************************************************************
" Used for moving one space in insert mode
"*****************************************************************************

inoremap qh <C-o>h
inoremap qj <C-o>j
inoremap qk <C-o>k
inoremap ql <C-o>l

"*****************************************************************************
" Used for breaking out of brackets
"*****************************************************************************

inoremap qa <Esc>la
inoremap jk <Esc>la

"*****************************************************************************
" Paste on line below / line above
"*****************************************************************************

" Remove default binding for P first
map P <Nop>
nnoremap <silent> Pj ]p
nnoremap <silent> Pk [p

"*****************************************************************************
" Experimentally putting characters on/near home row with <C- > 
"*****************************************************************************

" Home
inoremap <silent> <C-g> 0
nnoremap <silent> <C-g> 0
vnoremap <silent> <C-g> 0

" First Character
inoremap <silent> <C-h> ^
nnoremap <silent> <C-h> ^
vnoremap <silent> <C-h> ^

" End
inoremap <silent> <C-l> $
nnoremap <silent> <C-l> $
vnoremap <silent> <C-l> $

" Left Paren
inoremap <silent> <C-j> ()<C-o>i
nnoremap <silent> <C-j> (
vnoremap <silent> <C-j> (

" Left Curly Brace
inoremap <silent> <C-k> {}<C-o>i
nnoremap <silent> <C-k> {
vnoremap <silent> <C-k> {

" Left Square Bracket
inoremap <silent> <C-i> []<C-o>i
nnoremap <silent> <C-i> [
vnoremap <silent> <C-i> [

" Percent
inoremap <silent> <C-n> %
nnoremap <silent> <C-n> %
vnoremap <silent> <C-n> %

" Backtick
inoremap <silent> <C-'> `
nnoremap <silent> <C-'> `
vnoremap <silent> <C-'> `

" Equals
inoremap <silent> <C-e> =
nnoremap <silent> <C-e> =
vnoremap <silent> <C-e> =

onoremap <silent> t$ $
"*****************************************************************************
" Center line in middle of screen while in insert mode
"*****************************************************************************

inoremap <silent> zz <C-o>zz

"*****************************************************************************
" Move line to middle of screen
"*****************************************************************************

nnoremap <silent> zl zz

"*****************************************************************************
" Move line to top of screen
"*****************************************************************************

nnoremap <silent> zk zt2k2j

"*****************************************************************************
" Move line to bottom of screen
"*****************************************************************************

nnoremap <silent> zj zb2j2k

"*****************************************************************************
" Select All
"*****************************************************************************

nnoremap <silent> <C-a> ggVG

"*****************************************************************************
" Spaces to Tabs
"*****************************************************************************

" Four spaces -> tab
nnoremap <silent> <leader><leader>t :%%!unexpand -t 4 --first-only<CR>
" Two spaces -> tab
nnoremap <silent> <leader><leader>t :%%!unexpand -t 2 --first-only<CR>


"*****************************************************************************
" Unbinding the mouse
"*****************************************************************************

set mouse=a
map <LeftMouse> <NOP>
map <RightMouse> <NOP>


"*****************************************************************************
" Remaping Pgup Pgdn
"*****************************************************************************

map <silent> <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <silent> <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>


"*****************************************************************************
" This unsets the "last search pattern" register by hitting return
"*****************************************************************************

nnoremap <silent> <Esc> :noh<CR><Esc>
" nnoremap <silent> <CR> :noh<CR><CR>
nnoremap <silent> <CR> :noh<CR>

"*****************************************************************************
" Find and Replace
"*****************************************************************************

nnoremap ? :%s/
vnoremap ? :%s/\%V

"*****************************************************************************
" Toggle comments
"*****************************************************************************

" Comment in return blocks of React functional components (linewise)
	" Comment
nnoremap <silent> <leader><leader>c 0i{/* <C-o>$<C-o>a */}<Esc>
	" Uncomment
nnoremap <silent> <leader><leader>u 0dt*x$F*xxx
nnoremap <silent> <leader><leader>v 0dt*x$F*xxx
