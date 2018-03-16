
"======================================

"
"LN_Golang
"
"let g:go_fmt_command = "gofmt"

autocmd FileType go compiler go
"au BufRead,BufNewFile *.go set filetype=go
"Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>gs <Plug>(go-implements)
"Show type info for the word under your cursor
au FileType go nmap <Leader>gi <Plug>(go-info)
"Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"Run commands
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
"By default gd is enabled which opens the target identifier in current buffer. 
"You can also open in vertical, horizontal or tab for the word under your cursor:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

"Disable opening browser after posting to your snippet to play.golang.org:
let g:go_play_open_browser = 0
"By default vim-go shows errors for the fmt command, to disable it:
let g:go_fmt_fail_silently = 1
"Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"
"Disable auto fmt on save:
let g:go_fmt_autosave = 0
"By default binaries are installed to $GOBIN or $GOPATH/bin. To change it:
"let g:go_bin_path = expand("~/.gotools")
"let g:go_bin_path ="/home/fatih/.mypath"			 
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
