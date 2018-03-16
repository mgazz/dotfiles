function! SearchAg()
	normal vey,a
    "normal! *
endfunction

function! VerticalShrink()
	vertical resize -15
endfunc

function! VerticalEnlarge()
	vertical resize +15
endfunc

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	 let l:currentBufNum = bufnr("%")
	 let l:alternateBufNum = bufnr("#")

	 if buflisted(l:alternateBufNum)
		 buffer #
	 else
		 bnext
	 endif

	 if bufnr("%") == l:currentBufNum
		 new
	 endif

	 if buflisted(l:currentBufNum)
		 execute("bdelete! ".l:currentBufNum)
	 endif
endfunction

function! CommandLinePluginInstall()
	PluginInstall
	qall
endfunc

function! CommandLinePlugInstall()
	PlugInstall
	qall
endfunc



function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
		set nonumber
	else
		set number
		set relativenumber
	endif
endfunction

"
"FN_Functions
"

function! CopyReplace()
" corretto.. cambia solo colore della parola evideziata 	

	"salvo la parola ricercata
	let l:old_word = expand("<cword>")

	highlight MyGroup ctermbg=46 ctermfg=0"
	"exe ":highlight MyGroup ctermbg=46 ctermfg=0"
	"exe ":let m = matchadd(\"MyGroup\",\"" . l:old_word . "\")"
	"exe ":call matchdelete(l:match)"
	

	"numero di righe da copiare e modificare
	let l:rel_line= 1 * input('rel_lines:')

	let l:yank_lines = l:rel_line + 1
	
	"nuova parola
	let l:new_word= input('R word:')

	"copio le righe
	exe ":yank r " . l:yank_lines 


	let l:curr_line = line('.')
	echo "current line: " . l:curr_line
	"let l:output_line = l:curr_line + l:yank_lines - 1
	let l:output_line = l:curr_line + l:rel_line

	"spostati di n linee
	call cursor(l:output_line ,0)

	"stampa registro
	exe "normal! \"rp"


	"comando dim modifica
	exe ":.,.+" . l:yank_lines."s/" . l:old_word . "/" . l:new_word . "/cg"

endfunction

function! Replace()
" corretto.. cambia solo colore della parola evideziata 	

	"salvo la parola ricercata
	let l:old_word = expand("<cword>")

	highlight MyGroup ctermbg=46 ctermfg=0"
	"exe ":highlight MyGroup ctermbg=46 ctermfg=0"
	"exe ":let m = matchadd(\"MyGroup\",\"" . l:old_word . "\")"
	"exe ":call matchdelete(l:match)"
	

	"numero di righe da copiare e modificare
	let l:rel_line= 1 * input('rel_lines:')

	let l:yank_lines = l:rel_line + 1
	
	"nuova parola
	let l:new_word= input('R word:')

	"comando dim modifica
	exe ":.,.+" . l:yank_lines."s/" . l:old_word . "/" . l:new_word . "/cg"

endfunction

function! ChangeWord(yank_lines,old_word)
endfunction

function! CmdLine(str)
		exe "menu Foo.Bar :" . a:str
		emenu Foo.Bar
		unmenu Foo
endfunction


function! VisualSelection(direction) range
		let l:saved_reg = @"
		execute "normal! vgvy"

		let l:pattern = escape(@", '\\/.*$^~[]')
		let l:pattern = substitute(l:pattern, "\n$", "", "")

		if a:direction == 'b'
				execute "normal ?" . l:pattern . "^M"
		elseif a:direction == 'gv'
				call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
		elseif a:direction == 'replace'
				call CmdLine("%s" . '/'. l:pattern . '/')
		elseif a:direction == 'f'
				execute "normal /" . l:pattern . "^M"
		endif

		let @/ = l:pattern
		let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
		if &paste
				return 'PASTE MODE	'
		en
		return ''
endfunction




function! CountWindows()
	let nwin = winnr('$')
	echo nwin
endfunc
function! CloseBuffer()
	call CloseNerdTreeTagList()
	if(CountListedBuffers()==1)
		exit
	else 
		bdelete
		syntax enable	"to resolv syntax off behavior by MBE
	endif
endfunction



function! CountListedBuffers()
		let num_bufs = 0
		let idx = 1
		while idx <= bufnr("$")
				if buflisted(idx)
						let num_bufs += 1
				endif
				let idx += 1
		endwhile
		return num_bufs
endfunction





function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! ChangeTab()
	"call Stab()
	set noexpandtab
	exe "%retab!"
	call Stab()
endfunction



function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction

function! EnableSyntax()
	if exists("g:syntax_on")
		echo 'syntax disabled'
		syntax off
	else
		echo 'syntax enabled'
		syntax enable
	endif
endfunction
"======================================
