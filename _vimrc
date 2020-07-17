" "	"	  ,
" "	"	 "\",
" "	"	 "=\=",      Vim configuration file by Salatiel García
" "	"	  "=\=",
" "	"	   "=\=",
" "	"		"-\-"       ,---,
" "	"		   \       _)   (_
" "	"	 ldb    `     [__INK__]
" ========================================================================
"                                 Plugins 
" ========================================================================

set nocompatible              " be iMproved, required
set shellslash
filetype off                  " required
set rtp+=C:/Users/sanchro1/vimfiles/bundle/vundle.vim
call vundle#rc('C:/Users/sanchro1/vimfiles/bundle/')
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'machakann/vim-sandwich'
Plugin 'ervandew/supertab'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-scripts/wimproved.vim' " For Windows only
Plugin 'gcavallanti/vim-noscrollbar'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'machakann/vim-highlightedyank'
Plugin 'mattn/vimtweak' "Copy dll to gvim exe location
Plugin 'kien/ctrlp.vim'
" Plugin 'mattn/transparency-windows-vim'
Plugin 'joshdick/onedark.vim'
call vundle#end()            " required
filetype plugin indent on    " required
"
" ======================================================================================
"                                 Plugins Configuration 
" ======================================================================================

" ultisnips:
let g:pymode_python = 'python3'
let g:UltiSnipsSnippetDirectories=['C:/Users/sanchro1/Documents/dmt/lib/snips/']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit = 'tabdo'
"
" nedCommenter:
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign = 'left'
" let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '\ ' } }
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDUsePlaceHolders = 0
"
"NERDTree
let g:NERDTreeWinSize = 29
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeRemoveFileCmd='del '
"
function! Noscrollbar()
	return noscrollbar#statusline(15,'─','█',['▐'],['▌'])
endfunction
function! Apath()
	return fnamemodify(getcwd(), ":~")
	" return getcwd()
endfunction
" function! CloseSymbol()
"     return '  '
" endfunction
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ 'component_function': {
		 \ 'percent': 'Noscrollbar',
		 \ 'absolutepath': 'Apath',
	  \ }
	\ }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.active = {
	\ 'left': [ [ 'mode','spell','paste'],
	\           [ 'readonly', 'absolutepath'] ],
	\ 'right': [ [ 'lineinfo'],
	\            ['percent'],
	\            [ 'filetype' ] ] }
let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ] }
let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [ 'close' ] ]}
" let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_separator = { 'left': '', 'right': '' }
" let g:lightline.tabline_subseparator = { 'left': '⮁', 'right': '⮃' }
let g:lightline.tabline_subseparator = { 'left': '│', 'right': '│' }
"
" autopairs
" let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"
" Goyo, distraction free mode
let g:goyo_width=140
let g:goyo_height=100
let g:goyo_linenr=4
"
" Supertab
" let g:SuperTabDefaultCompletionType='context'
" let g:SuperTabDefaultCompletionType = '<C-n>'
function DictContext()
  if filereadable(expand('%:p:h') . '/tags')
	return "\<c-x>\<c-k>"
  endif
  " no return will result in the evaluation of the next
  " configured context
endfunction
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover', 'DictContext']
"
" LanguageTool
let g:languagetool_jar='C:/Users/sanchro1/vimfiles/pack/plugin/start/LanguageTool/LanguageTool-5.0/languagetool.jar'
let g:languagetool_disable_rules= 'WHITESPACE_RULE,EN_QUOTES,COMMA_PARENTHESIS_WHITESPACE,CURRENCY,UNIT_SPACE,MORFOLOGIK_RULE_EN_US,MULTIPLICATION_SIGN,ARROWS,EN_COMPOUNDS,WORD_CONTAINS_UNDERSCORE'
"
" Startify
let g:startify_bookmarks = [ {'c': '~\_vimrc'},
			\ {'b': 'C:/Users/sanchro1/Documents/dmt/yolikan/AtmelStudio/test02/test02/bpm30100_oled/Sketch.cpp'},
			\ {'n': 'C:/Users/sanchro1/Documents/dmt/yolikan/AtmelStudio/notasAS.md'},
			\ {'g': 'C:/Users/sanchro1/Documents/dmt/genNotes.md'},
			\ {'d': 'C:/Users/sanchro1/Documents/dmt/yolikan/docsCofepris/pruebasDeLaboratorio.md'},]
			" \ {'t':'C:/Users/angel/Documents/cidesi/trash/texTrash/trash.tex'}
let g:startify_lists = [{ 'type': 'files',     'header': ['   MRU']}, { 'type': 'bookmarks', 'header': ['   Bookmarks']}, { 'type': 'commands',  'header': ['   Commands']}]
"
" YankStack
let g:yankstack_map_keys = 0
nmap <A-a> <Plug>yankstack_substitute_older_paste
nmap <A-A> <Plug>yankstack_substitute_newer_paste
"
" FZF
" let g:fzf_layout = {'down':'~90%'}
" " let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
" let $FZF_DEFAULT_OPTS = '--layout=default --inline-info'
" "-g '!{node_modules,.git}'
" "
" " Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
"
" CtrlP
let g:ctrlp_cmd = 'CtrlP ~/Documents/dmt/'
nnoremap <C-S-v> :CtrlP ~/vimfiles/<CR>
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:20'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = {
	\   'dir' : '\.git$\|build$\|bower_components\|node_modules\|dist\|target' ,
	\ 	'file' : '\v\.(exe|dll|lib|docx|pdf|jpg|jpeg|png|sldprt|SchDoc|PcbDoc|PcbLib|xlsx|tags)$'
	\ }
"
" =============================================================================
"                                 Basic Config 
" =============================================================================

cd C:\Users\sanchro1\Documents\dmt
lang en_us
set langmenu=en_us
set path+=**
filetype plugin on    " required
filetype indent on
set nocompatible
syntax enable
set guioptions=!vAfcgt
set laststatus=2
set showtabline=2
set viewoptions=cursor,folds,slash,unix
set guifont=Consolas:h11:qCLEARTYPE
autocmd GUIEnter * silent! WToggleClean " For Windows only
set linespace=2
colorscheme onedark
hi Comment guifg=#6F7A91
" HL Yank
highlight HighlightedyankRegion guibg=#282c34 guifg=#56b6c2
set termwinsize=24x0
set guipty
set nu
set rnu
set ruler
set hlsearch
set ignorecase
set tabstop=4
set softtabstop=-1 shiftwidth=0
set smarttab
set incsearch
set showcmd
set cursorline
set mouse=a
set backspace=2
set backspace=indent,eol,start
set complete+=kspell
set splitright
set splitbelow
" Indent linebreaks
set breakindent
set autoindent
" System commands
set autoread 
set autowrite
set autochdir
set wildmenu
set wildmode=list:full
set wrap linebreak
" set colorcolumn=80
set clipboard^=unnamed
set tags=./tags,tags
" set sessionoptions="buffers,curdir,folds,localoptions,options,slash,tabpages,terminal"
" set encoding=utf-8
" set fileencoding=utf-8
"
" reduce priority of searches
set suffixes= ".bak,~,.o,.h,.info,.swp,.obj,.lis, .mt0, .ac0, .mb0, .st0, .sw0, .s2p, .ic0, .hr0, .mr0, .ms0, .dp0, .ma0, .sc0, .html, .tr0, .hb0, .printhb0, .printtr0, .printsw0, .printac0, .pa0"
"
" Use utf-8 by default
" if has("multi_byte")
"   if &termencoding == ""
"     let &termencoding = &encoding
"   endif
  set encoding=utf-8                   
  setglobal fileencoding=utf-8        
" endif
"
if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
"
" Allow color schemes to do bright colors without forcing bold.
" if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
"   set t_Co=16
" endif
"
" Improve memory used for spelling
syn sync maxlines=40000
syn sync minlines=1000
"
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= '['.v:lnum.'] '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label " . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}
"
" Restore window size and position
" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1
"
" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1
"
if has("gui_running")
	function! ScreenFilename()
	if has('amiga')
		return "s:.vimsize"
	elseif has('win32')
		return $HOME.'\_vimsize'
	else
		return $HOME.'/.vimsize'
	endif
	endfunction
	"
	function! ScreenRestore()
	" Restore window size (columns and lines) and position
	" from values stored in vimsize file.
	" Must set font first so columns and lines are based on font size.
	let f = ScreenFilename()
	if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
		let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
		for line in readfile(f)
			let sizepos = split(line)
			if len(sizepos) == 5 && sizepos[0] == vim_instance
				silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
				silent! execute "winpos ".sizepos[3]." ".sizepos[4]
				return
			endif
		endfor
	endif
	endfunction
	"
	function! ScreenSave()
	" Save window size and position.
	if has("gui_running") && g:screen_size_restore_pos
		let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
		let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
			\ (getwinposx()<0?0:getwinposx()) . ' ' .
			\ (getwinposy()<0?0:getwinposy())
		let f = ScreenFilename()
		if filereadable(f)
			let lines = readfile(f)
			call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
			call add(lines, data)
		else
			let lines = [data]
		endif
		call writefile(lines, f)
	endif
	endfunction
	"
	if !exists('g:screen_size_restore_pos')
		let g:screen_size_restore_pos = 1
	endif
	if !exists('g:screen_size_by_vim_instance')
		let g:screen_size_by_vim_instance = 1
	endif
	autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
	autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
"
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{noscrollbar#statusline()}
" ==================================================================================
"                                 Shortcut Mappings 
" ==================================================================================

" Insert time stamp
nmap <F3> i<C-R>=strftime("%a %d/%b/%Y, %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%a %d/%b/%Y, %I:%M %p")<CR>
"
" Help
nnoremap <F1> :tab h 
nnoremap <F9> :se rnu!<CR>
nnoremap <F12> :terminal<CR>
"
" Activate spellcheck
nmap <F6> :setlocal spell spelllang=
nmap <S-F6> :syntax sync fromstart <CR>
"
" Change default use of comma to :
nnoremap , :
vnoremap , :
nnoremap : ;
nnoremap ; ,
nnoremap ` '
nnoremap <Esc><Esc> :nohl<CR>
"
" Remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"
" NERDTree on enter buffer
" autocmd vimenter * NERDTree
"
let mapleader='¿'
let maplocalleader='¿'
nnoremap <Leader>f  :NERDTree<CR>
nnoremap <Leader>r  <Esc>:e!<Enter>
nnoremap <Leader>e  <Esc>:edit .<Enter>
nnoremap <Leader>co <Esc>:tabnew ~/_vimrc<CR>
nnoremap <Leader>lc <Esc>:tabnew ~/vimfiles/ftplugin/tex.vim<CR>
nnoremap <Leader>do <Esc>:e ++ff=dos<CR>
nnoremap <Leader>pd :!pandoc % -o %:t:r.
"
" move between windows
noremap <A-Down> <C-W><C-J>
noremap <A-Up> <C-W><C-K>
noremap <A-Right> <C-W><C-L>
noremap <A-Left> <C-W><C-H>
"
" tabs commands
noremap <C-S-Tab> <Esc>:tabprevious<CR> 
noremap <C-Tab> <Esc>:tabnext<CR> 
"
" Fullscreen for Windows
nnoremap <F11> :WToggleFullscreen<CR>
"
" Session save
nnoremap <Leader>ms :mksession! session.vim<CR>
nnoremap <Leader>rs :so session.vim<CR>
nnoremap <Leader>mv :mkview! view.vim<CR>
nnoremap <Leader>rv :so view.vim<CR>
"
" Split commands
" nnoremap <Leader>vo <Esc>:vsp<Space>
" nnoremap <Leader>ho <Esc>:sp<Space>
nnoremap <Leader>ta <Esc>:tabnew **/*
nnoremap <Leader>tn <Esc>:tabnew 
"
"
"make wrapped lines more intuitive
noremap <silent> k gk
noremap <silent> j gj
" noremap <silent> 0 g0
" noremap <silent> $ g$
"
noremap <silent> <Up> gk
noremap <silent> <Down> gj
nnoremap <S-Up> 3<C-y>
nnoremap <S-Down> 3<C-e>
" nnoremap K <C-y>
" nnoremap J <C-e>
"
" Tabular commands
" set verbose=2
" vnoremap <Tab> >gv
" vnoremap <S-Tab> >gv
nnoremap < >>
nnoremap > <<
" =============================================================================
"                                 Autocommands 
" =============================================================================

nnoremap <Leader>S :call TrashFunc()<CR>
function! TrashFunc()
	tabnew
	Startify
endfunction
" nnoremap <Leader>xc :cd %:p:h<CR>
autocmd BufEnter * silent! lcd %:p:h
au FileType *.cpp e ++ff=dos<CR>

" File completition
" inoremap <C-f> <C-x><C-f>
" cd C:\Users\angel\Documents\cidesi\PhD
" se nofoldenable
" set listchars=tab:>_,nbsp:_,trail:·
" set lis
