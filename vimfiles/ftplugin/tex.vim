iabbrev <buffer> etal \textit{et. al.}
iabbrev <buffer> item \item
iabbrev <buffer> vth $V_{th}$
setlocal guioptions=!vAfcgt
setlocal indentexpr=
setlocal spell spelllang=es_mx
syntax sync fromstart
setlocal iskeyword+=:
setlocal autochdir
setlocal nosmarttab
" let g:Tex_BibtexFlavor = 'biber'
" let g:Tex_BibtexFlavor = 'bibtex'
" set noautochdir
nmap <A-a> <Plug>yankstack_substitute_older_paste
nmap <A-A> <Plug>yankstack_substitute_newer_paste
nnoremap <buffer> <F6> :setlocal spell spelllang=
nnoremap <buffer> <S-F6> :syntax sync fromstart<CR>
nnoremap <buffer> <silent> <F4> :py3 import hslib as hs; hs.cleanTex()<CR>
nnoremap <buffer> <C-i> ^i./<Esc>hd$A\input{<Esc>pa}
" section jumping
noremap <buffer> <silent> ]] :<c-u>call TexJump2Section( v:count1, '' )<CR>
noremap <buffer> <silent> [[ :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
noremap <buffer> <silent> ]f :<c-u>call TexJump2Frame( v:count1, '' )<CR>
noremap <buffer> <silent> [f :<c-u>call TexJump2Frame( v:count1, 'b' )<CR>
function! TexJump2Section( cnt, dir )
	let i = 0
	let pat = '^\s*\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
	let flags = 'W' . a:dir
	while i < a:cnt && search( pat, flags ) > 0
	 let i = i+1
	endwhile
	let @/ = pat
endfunction
function! TexJump2Frame( cnt, dir )
	let i = 0
	let pat = '\\begin{frame}'
	let flags = 'W' . a:dir
	while i < a:cnt && search( pat, flags ) > 0
	 let i = i+1
	endwhile
	let @/ = pat
endfunction
" au BufEnter destratShort02.tex let g:Tex_BibtexFlavor = 'bibtex'
" Autopairs
let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':"'", '$':'$'}
" vim latex
" let g:Imap_FreezeImap = 1
" let g:Tex_UsePython = 1
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_MultipleCompileFormats = 'pdf, aux'
" let g:Tex_ViewRule_format = "SumatraPDF"
" let g:tex_flavor='latex'
" " let g:Tex_BibtexFlavor = 'biber'
" " let g:Tex_BibtexFlavor = 'bibtex'
" let g:Tex_DefaultTargetFormat = 'pdf'
" " let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -shell-escape -interaction=nonstopmode $*'
" let g:Tex_CompileRule_pdf = 'latexmk -pdf -latexoption="-synctex=1 -shell-escape -interaction=nonstopmode" -pv $*'
" let g:Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance'
" let g:Tex_IgnoreLevel=0
" let g:Tex_GotoError=0
" let g:Tex_FoldedSections=''
" let g:Tex_EnvLabelprefix_figure = "fig:"
" let g:Tex_EnvLabelprefix_equation = "eq:"
" let g:Tex_EnvLabelprefix_table = "tab:"
" let g:Tex_EnvLabelprefix_align = "eq:"
" En sumatra:= "C:\Program Files\Vim\vim81\gvim.exe" -c ":RemoteOpen +%l %f"
" " Tex-fold
" let g:tex_fold_override_foldtext = 0
"
" vimtex
" let g:vimtex_quickfix_method='pplatex'
" let g:vimtex_quickfix_method='pulp'
let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 0,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-shell-escape',
        \   '-interaction=nonstopmode',
        \ ],
        \}
let g:vimtex_quickfix_latexlog = {
          \ 'default' : 1,
          \ 'ignore_filters' : [],
          \ 'general' : 1,
          \ 'references' : 0,
          \ 'overfull' : 1,
          \ 'underfull' : 0,
          \ 'font' : 1,
          \ 'packages' : {
          \   'default' : 1,
          \   'general' : 1,
          \   'babel' : 1,
          \   'biblatex' : 1,
          \   'fixltx2e' : 1,
          \   'hyperref' : 1,
          \   'natbib' : 1,
          \   'scrreprt' : 1,
          \   'titlesec' : 1,
          \ },
          \}

let g:vimtex_imaps_enabled=0
let g:vimtex_indent_enabled=0
let g:vimtex_view_method='general'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
    \ . ' -inverse-search "gvim --servername ' . v:servername
    \ . ' --remote-send \"^<C-\^>^<C-n^>'
    \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
    \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
    \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
    \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
let b:vimtex_main = 'tesisMain.tex'
" En Sumatra: "C:\Program Files\Vim\vim82\gvim.exe" --remote-silent +%l %f
