" Vim filetype plugin
" Language:	Ruby
" Maintainer: Carl Mueller, cmlr@math.rochester.edu
" Last Change:	July 25, 2002
" Version:  1.2
" Website:  http://www.math.rochester.edu/u/cmlr/vim/syntax/index.html
"
"  This file gives some macros to help type Ruby programs.

set notimeout
set smartindent
set smarttab
set autoindent
set shiftwidth=2

noremap <buffer> K :!ruby %<CR>

nnoremap <buffer> <F1> :if strpart(getline(1),0,21) !='#!/usr/math/bin/ruby'<CR>0put ='#!/usr/math/bin/ruby'<CR>put =''<CR>endif<CR>:if getline(3) != ""<CR>1put =''<CR>endif<CR><Space>3Gi

inoremap <buffer> ;; ;
inoremap <buffer> ;e <CR><BS>end
inoremap <buffer> ;h <Space>=><Space>

inoremap <buffer> " <C-R>=<SID>Double('"','"')<CR>
inoremap <buffer> ` <C-R>=<SID>Double('`','`')<CR>
inoremap <buffer> ' <C-R>=<SID>Double("\'","\'")<CR>
inoremap <buffer> ( ()<Left>
inoremap <buffer> [ <C-R>=<SID>Double("[","]")<CR>
inoremap <buffer> { <C-R>=<SID>Double("{","}")<CR>

function! s:Double(left,right)
    if strpart(getline(line(".")),col(".")-2,2) == a:left . a:right
	return "\<Del>"
    else
	return a:left . a:right . "\<Left>"
    endif
endfunction

vnoremap <buffer> `[ <C-C>`>a]<Esc>`<i[<Esc>
vnoremap <buffer> `( <C-C>`>a)<Esc>`<i(<Esc>
vnoremap <buffer> `{ <C-C>`>a}<Esc>`<i{<Esc>
vnoremap <buffer> `" <C-C>`>a"<Esc>`<i"<Esc>
vnoremap <buffer> `` <C-C>`>a`<Esc>`<i`<Esc>

noremap <buffer> <C-Del> :call <SID>DeleteBrackets()<CR>

function! s:DeleteBrackets()
   let c = getline(line("."))[col(".") - 1]
   if c =~ '{[('
      normal %r ``x
   elseif c =~ '}])'
      normal %%x``r ``
   elseif c == '"'
      exe "normal x/\"\<CR>x``"
   endif
endfunction

" The following macros automatically insert complete various ruby items.

noremap <buffer> <C-Del> :call <SID>DeleteBrackets()<CR>

" To defuse the abbreviations.
inoremap <buffer> <C-Space> <C-V><Space>

inoremap <buffer> \| <C-R>=<SID>DoubleBars()<CR>
function! s:DoubleBars()
    if strpart(getline(line(".")),0,col(".")-2) =~ '[/#]'
	return "\|"
    else
	return "\|\|\<Left>"
    endif
endfunction

"iab <buffer> def <C-R>=<SID>SpecialAbbrev("def")<CR>
"
"iab <buffer> for <C-R>=<SID>For()<CR>
"iab <buffer> if <C-R>=<SID>SpecialAbbrev("if")<CR>
"iab <buffer> case <C-R>=<SID>Case()<CR>
"iab <buffer> module <C-R>=<SID>SpecialAbbrev("module")<CR>
"iab <buffer> unless <C-R>=<SID>SpecialAbbrev("unless")<CR>
"iab <buffer> until <C-R>=<SID>SpecialAbbrev("until")<CR>
"iab <buffer> while <C-R>=<SID>SpecialAbbrev("while")<CR>
"iab <buffer> class <C-R>=<SID>Class()<CR>
"iab <buffer> each_with_object <C-R>=<SID>Eachwithobject()<CR>
"iab <buffer> ea <C-R>=<SID>EachBrace()<CR>
"iab <buffer> times <C-R>=<SID>Times()<CR>
"iab <buffer> ma <C-R>=<SID>MapBrace()<CR>
"iab <buffer> map <C-R>=<SID>MapDo()<CR>
"iab <buffer> it <C-R>=<SID>It()<CR>


function! s:SpecialAbbrev(string)
    if getline(line(".")) =~ '\S'  " Not a blank line.
	return a:string
    else 
	return a:string . "\<CR>end\<Esc>kA"
    endif
endfunction

function! s:For()
    if getline(line(".")) =~ '\S'  " Not a blank line.
	return "for"
    else 
	return "for in \<CR>end\<Esc>k$3hi"
    endif
endfunction

function! s:It()
    return "it \"tests_something\" do\<Esc>oend\<Esc>k2lv13l"
endfunction

function! s:Case()
    return "case\<Esc>owhen \<Esc>oend\<Esc>2kA"
endfunction

function! s:Class()
  return "class < InheritsFrom\<Esc>o\<CR>end\<Esc>2kf<h"
endfunction

function! s:EachDo()
     return "each do |item|\<Esc>oend\<Esc>kwfiv2l"
endfunction

function! s:Eachwithobject()
     return "each_with_object(object) do |item,memo|\<Esc>oend\<Esc>kwf("
endfunction

function! s:EachBrace()
     return "each { |item| }\<Esc>7h"
endfunction

function! s:MapBrace()
     return "map { |item| }\<Esc>7hv3l"
endfunction

function! s:MapDo()
     return "map do |item|\<Esc>oend\<Esc>kw3l"
endfunction

function! s:Times()
     return "times do |counter|\<Esc>oend\<Esc>kfc"
endfunction


