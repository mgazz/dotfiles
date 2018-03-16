filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
"*****test*****
"Bundle 'bronson/vim-visual-star-search'
"Bundle 'idanarye/vim-vebugger'
"Bundle 'ervandew/eclim'
"Bundle 'benmills/vimux'
"Bundle 'quark-zju/vim-cpp-auto-include'
"*****ftest******
"
"latex
"Bundle 'lervag/vimtex'
Bundle 'python-mode/python-mode'
Bundle 'python-rope/ropevim'
"Bundle 'tell-k/vim-autopep8'


" let Vundle manage Vundle, required
Bundle 'gmarik/vundle.vim'

Bundle 'godlygeek/tabular'
"Bundle 'vim-scripts/Conque-GDB'
Bundle 'lilydjwg/colorizer'
"Bundle 'mgazz/vimwiki'
"Bundle 'chazy/cscope_maps'
"Bundle 'JamshedVesuna/vim-markdown-preview'
"Bundle 'Yggdroot/indentLine'

"Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'

"devops2.0 book
"Plugin 'derekwyatt/vim-scala'

" close brackets
"Bundle 'jiangmiao/auto-pairs'

"Bundle 'fatih/vim-go'
"Bundle 'vim-ruby/vim-ruby'
"undle 'tpope/vim-rails'

"Bundle 'tpope/vim-vinegar'
"Bundle 'jlanzarotta/bufexplorer'
"Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/tagbar'
"Bundle 'chazy/cscope_maps'
Bundle 'scrooloose/nerdtree'
"silver_searcher (fuzzy finder) ==> sudo apt-get install silversearcher-ag
Bundle 'rking/ag.vim'
"open file in dir, check buffer...
Bundle 'kien/ctrlp.vim'
Bundle 'jeetsukumaran/vim-buffergator'
""fucking colors
Bundle 'fatih/molokai'
""shortcut commenting
Bundle 'scrooloose/nerdcommenter'
"cool bar
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
"snippets engine
Bundle 'SirVer/ultisnips'
"snippet collection
Bundle 'honza/vim-snippets'
"completition engine
Bundle 'Valloric/YouCompleteMe'

"Bundle "Shougo/deoplete.nvim"

"for sources completetiton
"Bundle 'zchee/deoplete-clang'

" for includes
"Bundle 'Shougo/neoinclude.vim'

"deocomplete requirements
"Bundle "roxma/nvim-yarp"
"Bundle "roxma/vim-hug-neovim-rpc"

Bundle 'rdnetto/YCM-Generator'
"Bundle 'jeaye/color_coded'
"for yo paste command
Plugin 'https://github.com/tpope/vim-unimpaired' 

"" C++


""Bundle 'vim-scripts/nginx.vim'
""Bundle 'marijnh/tern_for_vim'
""Bundle 'moll/vim-node'
""
""for vim markdown
""Plugin 'godlygeek/tabular'
""Plugin 'plasticboy/vim-markdown'


""java support
"Bundle 'initrc/eclim-vundle'
""#Bundle 'vim-scripts/Conque-GDB'
""#Bundle 'scrooloose/syntastic'

""#Plugin 'tomtom/tcomment_vim'
""#Bundle 'vim-scripts/FuzzyFinder'
""#Plugin 'wincent/command-t.git'
""#Bundle 'ggreer/the_silver_searcher'
""#Bundle 'Raimondi/delimitMate'
""#Bundle 'tpope/vim-surround'
""#Bundle 'christoomey/vim-tmux-navigator'
""#Bundle 'Shougo/neocomplete.vim'
""#Bundle 'vim-scripts/L9'

""information --> needed for git info 
Bundle 'tpope/vim-fugitive'
""#Plugin 'jelera/vim-javascript-syntax'
""#Bundle 'pangloss/vim-javascript'
""#Plugin 'vim-scripts/taglist.vim'
""vim easy-tags for automatic ctags, vim-misc mandatory for easy-tags
""#Bundle 'xolox/vim-easytags'
""#Bundle 'xolox/vim-misc'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
