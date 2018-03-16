"
"Dependencies
"
if has('nvim')        " True color in neovim wasn't added until 0.1.5
  source	~/.vim/vim_plug.vim
else
  source	~/.vim/vundle-plugins.vim
endif

"
"Conf
"
source	~/.vim/conf/default.vim

source	~/.vim/conf/file-shortcuts.vim

source	~/.vim/conf/colors.vim

source	~/.vim/conf/buf-tab-win.vim

"conf based on filetype is in ~/.vim/ftplugin

source	~/.vim/conf/functions.vim

source	~/.vim/conf/plug-conf.vim

source	~/.vim/conf/filetype-conf.vim

"source	~/.vim/conf/.vim

"============ test ======================
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

"search functions calling this function
nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" search this definition
nmap <C-c>d :cs find g <C-R>=expand("<cword>")<CR><CR>
" search for string
nmap <C-c>s :cs find t <C-R>=expand("<cword>")<CR><CR>

" cscope next and previous
"nnoremap <C-c> <C-]><CR>
"nnoremap <C-S-c> <C-t><CR>

"----------------------------
"Ansible
"----------------------------
cnoreabbrev <expr> ast
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? '! cd ansible/ && ansible-playbook stage.yml -i hosts/stage' : 'ast')
cnoreabbrev <expr> asr
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? '! cd ansible/ && ansible-playbook stage-rpi.yml -i hosts/stage' : 'ast')
"----------------------------


"find word in file where the extension is .go
cnoreabbrev <expr> aggo
          \ ((getcmdtype() == ':' && getcmdpos() <= 5)? 'Ag -G \.go$ ' : 'aggo')
cnoreabbrev <expr> agja
          \ ((getcmdtype() == ':' && getcmdpos() <= 5)? 'Ag -G \.java$ ' : 'aggo')
" open cbash
cnoreabbrev <expr> ocb
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'e ~/.notes/bash/' : 'ocb')
cnoreabbrev <expr> ocg
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'e ~/.notes/cgit' : 'ocg')

cnoreabbrev <expr> ocv 
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'e ~/.notes/cvim.vim':'ocv')
cnoreabbrev <expr> oct 
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'e ~/.dotfiles/notes/ctmux':'oct')
cnoreabbrev <expr> oc
          \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'e ~/.commands.sh':'oc')
cnoreabbrev <expr> oa 
          \ ((getcmdtype() == ':' && getcmdpos() <= 3)? 'e ~/.aliases':'oa')

"======================================

let mapleader = "\<Space>"

nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Enter visual line mode with <Space><Space>
"nmap <Leader><Leader> V

"shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

"nmap <leader>e :e 
"nmap <leader><leader>c :! 
"Show variables and methods
map <Leader>tt :TagbarToggle<CR>
"change number settings
map <Leader>nt :call NumberToggle()<CR>

"
"CM_Commands
"
"set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
command! Home execute "e ~/"
"command! CpMan :call CscopeProjectManagement()
"command! CpCrate :call CscopeCreate()
"command! CpUpdate	:call CscopeCreate()

"======================================

"
"HI_Highlights
"
"disable highlight when enter insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

"======================================

"
"SR_SearchReplace
let mapleader = "\<Space>"
"replace current word in the next n lines
nnoremap <leader>tr :call CopyReplace()<cr>
nnoremap <leader>r :call Replace()<cr>

"======================================

"
"OpeningVIM
"
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
		 \ if line("'\"") > 0 && line("'\"") <= line("$") |
		 \	 exe "normal! g`\"" |
		 \ endif

"======================================


