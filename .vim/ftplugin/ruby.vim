set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

if has("autocmd")
    set omnifunc=rubycomplete#Complete
    let g:rubycomplete_buffer_loading=1
    let g:rubycomplete_classes_in_global=1
    let g:rubycomplete_rails=1
endif 
"======================================
