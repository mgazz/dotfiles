"
"PL_TagBar
"
"
autocmd VimEnter * TagbarOpen

"
"PL_Deoplete
"
"
let g:deoplete#enable_at_startup = 1
"remap copletetion to Tab
setlocal omnifunc=.
inoremap <expr><Tab>        pumvisible() ? "\<C-n>" : "\<Tab>"

"======================================
"
"
"PL_C++
"
"
command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
autocmd FileType cpp,h,hpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>

"======================================
"
"
"PL_Rainbow
"
"
let g:rainbow_active = 1

"======================================


"
"PL_Airline
"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 0
"" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='retro'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''

"======================================

"
"PL_Ack
"
let mapleader = "\<Space>"
noremap <Leader>a :Ack <cword><cr>
if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
  let g:ackprg = 'ag'
endif

"======================================

"
"PL_Ultisnips
"
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsListSnippets = "<C-tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

"======================================

"
"PL_PythonMode
"
let g:pymode_rope_completion = 1
let ropevim_extended_complete = 1
autocmd FileType python setlocal omnifunc=RopeCompleteFunc

"let g:ropevim_enable_shortcuts =1
"let g:pymode_doc = 1

"======================================


"
"PL_YouCompleteMe
"
" add completetion for cpp 
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"let g:ycm_confirm_extra_conf=0
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"number of entries in completetion window
set pumheight=5
set previewheight=7
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_collect_identifiers_from_tags_files = 1

" turn on completion in comments
let g:ycm_complete_in_comments=1
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
"======================================


"
"PL_Ag
"
nnoremap ,a :Ag!<Space>
"search test
"nnoremap <Leader>a vey :Ag! """<CR> 
nnoremap <silent><Leader>ag * :AgFromSearch<CR> 

"======================================


"
"PL_CtrlP
"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

let mapleader = "\<Space>"

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"======================================


"
"PL_Buffergator
"
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
"======================================


"
"PL_Eclim
"
let mapleader = "\<Tab>"
let g:EclimCompletionMethod = 'omnifunc'
nmap <leader>jc :JavaCorrect<cr>
nmap <leader>jg :JavaGet<cr>
nmap <leader>js :JavaSet<cr>
nmap <leader>ji :JavaImportOrganize<cr>
nmap <leader>jp :ProjectRefresh<cr>
"======================================


"
"ND_NERDTree
"
" enable line numbers
let NERDTreeShowLineNumbers=1
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=80
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
nmap - :NERDTreeToggle<cr>
"======================================


"
"VG_vim-go
"
"

"======================================


"
"IL_intentLine
"
 "vertical line indentation
 let g:indentLine_color_term = 238
 let g:indentLine_color_gui = '#09AA08'
 "let g:indentLine_char = '☠'
 let g:indentLine_char = '★'
"hi LineNr ctermfg=13 ctermbg=199
"hi LineNr ctermbg=199
"
"======================================


"
"VT_vimtex
"
let g:vimtex_disable_version_warning = 1


"Autopep8
let g:autopep8_max_line_length=79
let g:pymode_options_max_line_length=79
let g:pymode_syntax = 1
" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>
"autocmd BufWrite *.py :PymodeLintAuto<CR>
