"pathogen things you're using
"or at least you were using and were downloaded

"ctrlp.vim
"omnisharp-vim
"syntastic
"tabular
"undotree
"vim-airline
"vim-airline-themes
"vim-dispatch
"vim-fugitive
"xmledit

let mapleader = ","
let g:mapleader = ","
"winpos 1024 -50
set lines=900
set hlsearch
set columns=900
set backspace=indent,eol,start
set nocompatible
set cm=blowfish2
set nobackup
set nowritebackup
set incsearch
set fo-=c fo-=r fo-=o
set hidden

let g:statline_syntastic = 0
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	"setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
endif
set listchars=trail:∂,tab:\ \ 

"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
highlight NonText guifg=#FF0000
"execute pathogen#infect()

"filetype off                  " required

try
	so $VIM/charliewynn_vimrc/_vimrcpc
catch
	"no vimrcpc
endtry

syntax on
filetype plugin indent on    " required
set tabstop=2 shiftwidth=2 noexpandtab
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
set number
"runtime macros/matchit.vim
imap <S-CR> <Esc>
vmap <S-CR> <Esc>
nmap <S-CR> <nop>
"set relativenumber
set tabstop=4
set shiftwidth=4
set background=dark
color darkmate
"##############################################################################
" Easier split navigation
"##############################################################################

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelUp> <C-U>
map <S-ScrollWheelDown> <C-D>
let $vs=expand('C:\Users\wynnc\Documents\Visual Studio 2013\Projects')

"imap <C-j> <C-E><C-E><C-E><C-E><C-E>
"imap <C-k> <C-Y><C-Y><C-Y><C-Y><C-Y>
nmap gt @='gt'<cr>
nmap 0gt :tabfirst<cr>
nnoremap / /\v\c
vnoremap / /\v\c

let rot13 = 0 
map <F3> :call Rot13()<cr>``
imap <F3> <esc>:call Rot13()<cr>``a

fun! Rot13()
	normal! ggg?G
	if g:rot13 == 0 
		let g:rot13 = 1
		inoremap A N
		inoremap B O
		inoremap C P
		inoremap D Q
		inoremap E R
		inoremap F S
		inoremap G T
		inoremap H U
		inoremap I V
		inoremap J W
		inoremap K X
		inoremap L Y
		inoremap M Z
		inoremap N A
		inoremap O B
		inoremap P C
		inoremap Q D
		inoremap R E
		inoremap S F
		inoremap T G
		inoremap U H
		inoremap V I
		inoremap W J
		inoremap X K
		inoremap Y L
		inoremap Z M
		inoremap a n
		inoremap b o
		inoremap c p
		inoremap d q
		inoremap e r
		inoremap f s
		inoremap g t
		inoremap h u
		inoremap i v
		inoremap j w
		inoremap k x
		inoremap l y
		inoremap m z
		inoremap n a
		inoremap o b
		inoremap p c
		inoremap q d
		inoremap r e
		inoremap s f
		inoremap t g
		inoremap u h
		inoremap v i
		inoremap w j
		inoremap x k
		inoremap y l
		inoremap z m
	else
		let g:rot13 = 0
		iunmap A
		iunmap B
		iunmap C
		iunmap D
		iunmap E
		iunmap F
		iunmap G
		iunmap H
		iunmap I
		iunmap J
		iunmap K
		iunmap L
		iunmap M
		iunmap N
		iunmap O
		iunmap P
		iunmap Q
		iunmap R
		iunmap S
		iunmap T
		iunmap U
		iunmap V
		iunmap W
		iunmap X
		iunmap Y
		iunmap Z
		iunmap a
		iunmap b
		iunmap c
		iunmap d
		iunmap e
		iunmap f
		iunmap g
		iunmap h
		iunmap i
		iunmap j
		iunmap k
		iunmap l
		iunmap m
		iunmap n
		iunmap o
		iunmap p
		iunmap q
		iunmap r
		iunmap s
		iunmap t
		iunmap u
		iunmap v
		iunmap w
		iunmap x
		iunmap y
		iunmap z
	endif
endfun

fun! WriteBackupFile(file, path)
	"don't write for _vimrc
	"this isn't working - but for some reason it's stopped the problem
	"where saving the _vimrc took 3-4 seconds and flashed CMD windows over
	"and over!
	" this was because I kept sourcing my vim rc which was doing the write
	" once for every time I sourced.  au! in the moving backup group fixed it
	exe 'silent !move "'.expand("%:p").&bex.'" "'.expand("%:p:h")."/~".expand("%:t").".".strftime("%Y-%m-%d_%H.%M.%S").'.vimbackup"'
	exe 'silent !attrib +h '.a:path.'\*.vimbackup'
endfun

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

augroup movingBackup
	au!
	"au BufWritePost * call WriteBackupFile(expand("%:t"), expand("%:p:h"))
augroup END

fun! GenerateCtags()
	exe 'silent !ctags -a '.expand("%")
endfun

augroup config
	au!
	au BufReadPost *.config :setf xml
augroup END

nmap j gj
nmap k gk

"au BufWritePre '~'.* let &bex = '-' . strftime("%Y-%m-%d %H.%M.%S") . '.vimbackup'
set smartcase
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
imap <C-BS> <C-W>

map <leader>chrome :silent !start cmd /c "start chrome /new-tab %"<cr>
map <leader>ex :silent !start cmd /c "explorer %:h"<cr>

"put this line in your _vimrcpc file
"map <leader>vimrc :e D:/Vim/charliewynn_vimrc/_vimrc<cr>

map <leader>nt :NERDTree %:h<cr>
"autocmd bufwritepost _vimrc source $MYVIMRC
command! W w
command! Wq wq
command! WQ wq
command! Bp bp
command! BP bp
command! Bn bn
command! BN bn
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>
"filetype indent off

map <leader>js :w !node<cr><cr>
map <leader>sql :%s/\c\v[^^](from\|where)/\r\U\1\r  /g<cr> :%s/\v\c(join\|select)/\U\1\r  /g<cr>:noh<cr>

if v:version < 700 || exists('loaded_switchcolor') || &cp
	finish
endif

let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)
	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute "colorscheme " . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif

	else
		let s:swback = 1
		if (&background == "light")
			execute "set background=dark"
		else
			execute "set background=light"
		endif

		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif

	" show current name on screen. :h :echo-redraw
	redraw
	execute "colorscheme"
endfunction

map <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>

map <S-F8>      :call SwitchColor(-1)<CR>
imap <S-F8> <Esc>:call SwitchColor(-1)<CR>

nnoremap <F5> :UndotreeToggle<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

"let g:syntastic_javascript_eslint_exe = 'npm run eslint '

let g:user_emmet_leader_key='<c-e>'

nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

set laststatus=2
set noshowmode

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
"
" " Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif
filetype plugin on


set guifont=Fantasque_Sans_Mono:h12:cANSI:qDRAFT

