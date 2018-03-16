    
"au BufRead,BufNewFile *.go set filetype=go
"if &filetype=='go'
    "source	~/.vim/conf/go.vim
"endif

"au BufRead,BufNewFile *.rb set filetype=ruby
autocmd FileType ruby source ~/.vim/conf/rb.vim
"TODO: check for python,go,java,erb,...
