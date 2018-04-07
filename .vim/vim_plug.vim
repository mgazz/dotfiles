" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" yo copy paste
Plug 'tpope/vim-unimpaired' 
"Plug 'jeaye/color_coded' not supported yet
Plug 'rking/ag.vim'
"open file in dir, check buffer...
Plug 'kien/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/tagbar'
Plug 'lilydjwg/colorizer'
Plug 'python-mode/python-mode',{'branch': 'develop'}

Plug 'python-rope/ropevim'
Plug 'tell-k/vim-autopep8'
"
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"for sources completetiton
"Plug 'tweekmonster/deoplete-clang2'
" for includes
"Plug 'Shougo/neoinclude.vim'
Plug 'Valloric/YouCompleteMe', {'do' :'cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --clang-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"
"Plug 'dbgx/lldb.nvim', { 'do': ':UpdateRemotePlugins' } 
Plug 'vim-scripts/Conque-GDB'
"Plug 'huawenyu/neogdb.vim'

""shortcut commenting
Plug 'scrooloose/nerdcommenter'
"cool bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
"--------------------------------------------------------------------
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Initialize plugin system
call plug#end()
