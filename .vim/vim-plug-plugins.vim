call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'vim-scripts/Conque-GDB'
Plug 'lilydjwg/colorizer'
Plug 'mgazz/vimwiki'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Yggdroot/indentLine'
"Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'

"devops2.0 book
Plug 'derekwyatt/vim-scala'

Plug 'majutsushi/tagbar'

Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'fatih/molokai'
Plug 'scrooloose/nerdcommenter'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'honza/vim-snippets'
"completition engine
"Plug 'Valloric/YouCompleteMe'
"for yo paste command
Plug 'https://github.com/tpope/vim-unimpaired' 



" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plug options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plug outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()
