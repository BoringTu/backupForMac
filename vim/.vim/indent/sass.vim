" Vim indent file
" Language:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2016 Aug 29

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

"etlocal autoindent sw=2 et
setlocal indentexpr=GetSassIndent()
setlocal indentkeys=o,O,*<Return>,<:>,!^F

" Only define the function once.
if exists("*GetSassIndent")
  finish
endif

let s:property = '^\s*:\|^\s*[[:alnum:]#{}-]\+\%(:\|\s*=\)'
let s:extend = '^\s*\%(@extend\|@include\|+\)'

function! GetSassIndent()
  let lnum = prevnonblank(v:lnum-1)
  let line = substitute(getline(lnum),'\s\+$','','')
  let cline = substitute(substitute(getline(v:lnum),'\s\+$','',''),'^\s\+','','')
  let lastcol = strlen(line)
  let line = substitute(line,'^\s\+','','')
  let indent = indent(lnum)
  let cindent = indent(v:lnum)
  let increase = indent + &sw
  if line !~ s:property && line !~ s:extend && cline =~ s:property
    return indent + (exists('*shiftwidth') ? shiftwidth() : &sw)
  elseif line =~ s:extend
    return indent
  elseif line =~ ':$'
    return increase
  elseif line =~ ':\w\+$'
    return increase
  elseif line !~ ':'
    return increase
  else
    return -1
  endif
endfunction

" vim:set sw=2:
