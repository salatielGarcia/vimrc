colorscheme default

set nocompatible
set number
set hlsearch
set ignorecase
set tabstop=4
set softtabstop=4
set showcmd
"set cursorline

filetype indent on
filetype plugin on
"set wildmenu

set path+=**
set wildmenu

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

inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i

iabbrev bin #!/bin/bash

" HSpice
autocmd FileType spice call s:hspiceSetup()
function! s:hspiceSetup()
	"set nonumber
	map <F5> :!hspice.exe -mt 8 -hpp -i % -o  %:t:r.lis <Enter>
	map <F4> :!python.exe -c "import hslib as hs; hs.cleanHs()" <Enter>
	nnoremap ,b :-1read /cygdrive/c/Users/salatiel/Documents/cidesi/libs/snippets/placeholder<CR>
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
