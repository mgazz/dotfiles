
"TS_TestSection
"------------------- Test-section  ----------------------- 
"
"
"nnoremap <C-p> :Unite file_rec/async<cr>

let g:vim_markdown_folding_disabled = 1
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"reformat your text by marking it (visual mode) and typing gq
au BufNewFile,BufFilePre,BufRead *.md set tw=106

"speedup ctrlp --> http://softwareas.com/a-simple-way-to-speed-up-vim-ctrl-p-plugin-delegate-to-ag/
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .gitignore
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'


let g:ctrlp_working_path_mode = '0'

let g:VimuxHeight = "25"
let g:VimuxOrientation = "v"

"start server in tmux panel and connect to it 
function! JavaDebugStartServer() 
  let project = eclim#project#util#GetCurrentProjectName()
  if project == '' && exists('b:project')
    let project = b:project
  endif
  if project == ''
    call eclim#project#util#IsCurrentFileInProject()
    return
  endif
	let path= expand("%:r")
	let path_comp= split(path,"/")
	call remove(path_comp,"src")
	let class_name = join(path_comp,".")
  let command = 'clear && java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=1044 -classpath ./bin ' . class_name
	call VimuxRunCommand(command)
	sleep
	exe "JavaDebugStart localhost 1044"
endfunction

function! JavaDebugStopServer()
	exe "VimuxCloseRunner"
	exe "JavaDebugStop"
endfunction

function! MvnCreateProject()
	exe "Mvn archetype:generate -DgroupId=com.gazza.common -DartifactId=SpringExamples -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false"
	"mv in to artfifact creato
	exe "Mvn eclipse:eclipse"
endfunction
function! MvnInstall()
	let command = 'clear && mvn install'
	call VimuxRunCommand(command)
endfunction

function! MvnPackage()
	let command = 'clear && mvn package'
	call VimuxRunCommand(command)
	"call VimuxCloseRunner()
endfunction

 
let mapleader = "\<Space>"
nmap <silent>cr :VimuxCloseRunner<CR>
au FileType mvn_pom,java nmap <silent>mp :call MvnPackage()<CR>
au FileType mvn_pom,java nmap <silent>mi :call MvnInstall()<CR>
au FileType mvn_pom,java nmap <F5> :ProjectRefresh<CR>
"au FileType java nmap <Leader>mc :VimuxCloseRunner<CR>





function! DeleteNewLineAllFile()
	"silent! exec "%normal A "
	"cycle odd lines
	for s:i in range(1, line("$") / 2)
		execute "normal " . eval(s:i * 2 - 1) . "gg"
		execute "normal A ," 
	endfor

	exe "%norm! J"

	"cycle all lines
	for s:i in range(1, line("$") )
		execute "normal " . eval(s:i) . "gg"
		execute "normal 06f dw" 
		execute "normal 06f dw" 
	endfor

	write
	qall
endfunction

"function! CatchUri() 
"endfunction

au BufRead,BufNewFile *.en set filetype=txt
au BufRead,BufNewFile *.en :UltiSnipsAddFiletypes en
au BufRead,BufNewFile *.en :setlocal spell spelllang=en
"]s	next mispelled work
"[s	previous mispelled word
"z=	suggest correctly spelled word
"
"

"	vimwiki

"Headers

let g:vimwiki_hl_headers=1

hi VimwikiHeader1 guifg= #FF0000
hi VimwikiHeader2 guifg= #00FF00
hi VimwikiHeader3 guifg= #0000FF
hi VimwikiHeader4 guifg= #FF00FF
hi VimwikiHeader5 guifg= #00FFFF
hi VimwikiHeader6 guifg= #FFFF00


"Checked List
"whole line highlited when [X]
let g:vimwiki_hl_cb_checked=1


"let g:vimwiki_ext2syntax = {'.go': 'go', 
								"\ '.rb': 'ruby',
								"\ '.sh': 'bash'
								"\}

"create list with check box
let g:vimwiki_auto_checkbox = 1

let g:vimwiki_list=[
			\ {'path':'~/knowledge/script_bash',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/go',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/cmd_bash',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/ruby',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/python',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/vim',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/git',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/gnome',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\},
			\ {'path':'~/knowledge/monit',
			\'template_path':'~/knowledge/templates',
			\'template_default':'default',
			\'template_ext':'.html'
			\}
			\,
			\]

"let g:vimwiki_list=[
			"\ {'path':'~/vimwiki/knowledge'
			"\}]

let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"---------------------------------------------------- 
