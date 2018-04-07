"
"####
"## YouCompleteMe clang configuration
"####
"
cd ~/.vim/plugged/YouCompleteMe/
./install.sh --clang-completer
" in .vimrc
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" set YouCompleteMe configuration for your project
~/.vim/plugged/YCM-Generator/config_gen.py .


"open directory current file
":e %:h


"cscope search definition
<C-]>
"cscope previous jump
<C-t>

"exit
<C-[>

"search functions calling this function
nmap <C-c>c 
" search this definition
nmap <C-c>d 
" search for string
nmap <C-c>s

"change from " to ' --> vim surround
cs"'

"change comment color to green
":highlight Comment ctermfg=green
"set spellcheck
":set spell spelllang=en_us
"z= to check suggestions

"buffer navigations
let mapleader = "\<Space>"
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" import java project
:ProjectImport .
" after setting M2_REPO=~/.m2/repository refresh project
:ProjectRefresh



"Java
JavaConstructor
PingEclim
ProjectImport .
JavaRename
JavaDoc
JavaCorrect
JavaGetSet
JavaImport
ProjectRefresh
JavaImportOrganize
Javadoc


"change all lines strarting with test with ../images/sample_N.png
:let i = 1 | g/test/s//\=printf("..\/images\/sample_%2d.png", i)/ | let i = i+1

