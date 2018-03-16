
"set mapleader space and not \ 
let mapleader = "\<Space>"

"======================================

"fast save quit
"nnoremap <Leader>w :w<CR>
"nnoremap <Leader>q :q<CR>
nmap <silent> <leader>ev :e ~/.vimrc<CR>
if has('nvim')        " True color in neovim wasn't added until 0.1.5
  nmap <silent> <leader>vu :e ~/.vim/vim_plug.vim<CR>
else
  nmap <silent> <leader>vu :e ~/.vim/vundle-plugins.vim<CR>

endif
