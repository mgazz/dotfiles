
"
"D_Default
"
set shortmess=a
set cmdheight=2
"vim is utterly slow if reg=2
set regexpengine=1 " 
syntax on
"enable number in page
set number
set relativenumber
"copy indent from currentline when starting a new line
set autoindent 
"number of spaces that a <Tab> in the file contrs for
set tabstop=4
"number of spaces that <Tab> conts for while performing editing operations
set softtabstop=4
"determine the amount of spaces to insert or remove using the indentation comands in normal mode
set shiftwidth=4
"hidden to navigate buffet without save
set hidden 
"cause spaces to be used in place of <Tab>
set expandtab
"We are running Vim not Vi
set nocompatible
" Open new split panes to right and bottom, which feels more natural
set splitbelow
"set splitright
set backspace=2
"" Always show the status line
set laststatus=2
"show commands
set showcmd
set wrap
"highlight search
set hlsearch
set incsearch


set encoding=utf-8
" Remember info about open buffers on close
set viminfo^=%

set cinoptions+=(0

"set noswapfile

"ruler setting
set rulerformat=%-14.(%l,%c%V%)\ %P
"use the same symbol as TextMate for tabstop and EOL
set listchars=tab:▸\ ,eol:¬
"vim behave like command prompt
"set shellcmdflag=-ic

set cursorline
set cursorcolumn
"
" for local .vimrc
set exrc
" disable unsafe commands
set secure

"" Nvim conf
if has('nvim-0.1.5')        " True color in neovim wasn't added until 0.1.5
  set termguicolors
endif
