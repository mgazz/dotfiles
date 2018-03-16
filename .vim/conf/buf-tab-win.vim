
"
"Buffer
"
let mapleader = "\,"
" cycle back/forward recently viewed buffers
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>d :Bclose<cr>
"map <Leader>bo :BufExplorer<CR>

"======================================
"

"Tabs
"
let mapleader = "\<Tab>"
nnoremap <leader>c :tabnew<cr>
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>p :tabprevious<cr>
"map <leader>o :tabonly<cr>
nnoremap <leader>x :tabclose<cr>
" Opens a new tab with the current buffer's path
map <leader>e :tabedit <c-r>=expand("%:p:h")<cr>/

"======================================
"
"Windows
"
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h<CR>
nnoremap <C-l> <C-w>l<CR>
nnoremap <silent> <Leader>rl :call VerticalShrink()<CR>
nnoremap <silent> <Leader>rh :call VerticalEnlarge()<CR>

"======================================
"
"InsertMode
"
inoremap <C-l> <right>
inoremap <C-h> <left>
