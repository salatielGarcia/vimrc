colorscheme default

set nocompatible
set number
set ruler
set hlsearch
set ignorecase
set tabstop=4
set softtabstop=4
set showcmd
set cursorline

filetype indent on
filetype plugin on
set wildmenu

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor

set rtp+=~/.vim/bundle/vundle.vim
set rtp+=~/.vim/bundle/vim-snipmate/snippets

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/UltiSnips'
call vundle#end()

"======================== Plugin configurations
" snipMate :
imap <tab> <Plug>snipMateNextOrTrigger

" nedCommenter:
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



"========================

set path+=**

" command! MakeTags !ctags -R

" System commands
set autoread 
set autowrite
map ,r <Esc>:e!<Enter>
map ,e <Esc>:edit .<Enter>
map ,w <Esc>:w<Enter>
map ,q <Esc>:q<Enter>
map ,wq <Esc>:wq<Enter>

" Tab commands
set showtabline=2
map ,o <Esc>:tabnew<Space>
map <F7> <Esc>:tabprevious<Enter> 
map <F8> <Esc>:tabnext<Enter> 

" Split commands
map ,vo <Esc>:vsp<Space>
map ,ho <Esc>:sp<Space>
" map <C-w,C-w> <Esc><C-tab>


inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"iabbrev bin #!/bin/bash

" HSpice
autocmd FileType spice call s:hspiceSetup()
function! s:hspiceSetup()
	"set nonumber
	inoremap <F5> <Esc>:!hspice.exe -mt 8 -hpp -i % -o  %:t:r.lis <CR>
	nnoremap <F5> :!hspice.exe -mt 8 -hpp -i % -o  %:t:r.lis <CR>
	map <S-F5> :!cscope.exe -pfiles %:t:r.
	map <F4> :!python.exe -c "import hslib as hs; hs.cleanHs()"<CR>
	map <F6> :!python.exe -c "import hslib as hs; hs.lisChk('%:t:r')"<CR>
	nnoremap ,b :-1read /cygdrive/c/Users/salatiel/Documents/cidesi/libs/snippets/placeholder<CR>
	nnoremap <C-k> I*
	inoremap <C-k> <Esc>0I*
	vnoremap <C-k> I*
endfunction

" VIM
autocmd FileType vim call s:vimSetup()
function! s:vimSetup()
	"set nonumber
	nnoremap <C-k> I"
	inoremap <C-k> <Esc>0I"
	vnoremap <C-k> I"
endfunction

" Latex
autocmd FileType tex call s:texSetup()
function! s:texSetup()
		map <F5>  :!pdflatex -shell-escape -interaction nonstopmode %<Enter> <bar> :!biber %:t:r<Enter> <bar> :!pdflatex -shell-escape -interaction nonstopmode %<Enter>
>
endfunction

" Matlab
autocmd FileType matlab call s:matSetup()
function! s:matSetup()
	nnoremap <C-k> I%
	inoremap <C-k> <Esc>0I%
	vnoremap <C-k> I%
endfunction
