" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
plugin/CursorLineCurrentWindow.vim	[[[1
79
" CursorLineCurrentWindow.vim: Only highlight the screen line of the cursor in the currently active window.
"
" DEPENDENCIES:
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.001	08-Jun-2012	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_CursorLineCurrentWindow') || (v:version < 700)
    finish
endif
let g:loaded_CursorLineCurrentWindow = 1

"- functions -------------------------------------------------------------------

" Note: We use both global and local values of 'cursorline' to store the states,
" though 'cursorline' is window-local and only the &l:cursorline value
" effectively determines the visibility of the highlighting. This makes for a
" better value inheritance when splitting windows than a separate window-local
" variable would.

function! s:CursorLineOnEnter()
    if s:cursorline
	if &g:cursorline || exists('w:persistent_cursorline') && w:persistent_cursorline
	    setlocal cursorline
	else
	    setglobal cursorline
	endif
    else
	setlocal nocursorline
    endif
endfunction
function! s:CursorLineOnLeave()
    if s:cursorline
	if &l:cursorline
	    if ! &g:cursorline
		" user did :setlocal cursorline
		set cursorline
	    endif
	else
	    if &g:cursorline
		" user did :setlocal nocursorline
		set nocursorline
	    else
		" user did :set nocursorline
		let s:cursorline = 0
	    endif
	endif

	if exists('w:persistent_cursorline') && w:persistent_cursorline
	    setglobal nocursorline
	    setlocal cursorline
	else
	    setlocal nocursorline
	endif
    else
	if &g:cursorline && &l:cursorline
	    " user did :set cursorline
	    let s:cursorline = 1
	endif
    endif
endfunction


"- autocmds --------------------------------------------------------------------

let s:cursorline = &g:cursorline
augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * call <SID>CursorLineOnEnter()
    autocmd WinLeave                      * call <SID>CursorLineOnLeave()
augroup END

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
doc/CursorLineCurrentWindow.txt	[[[1
95
*CursorLineCurrentWindow.txt*	Only highlight the screen line of the cursor in the currently active window.

		 CURSOR LINE CURRENT WINDOW    by Ingo Karkat
						 *CursorLineCurrentWindow.vim*
description			|CursorLineCurrentWindow-description|
usage				|CursorLineCurrentWindow-usage|
installation			|CursorLineCurrentWindow-installation|
limitations			|CursorLineCurrentWindow-limitations|
known problems			|CursorLineCurrentWindow-known-problems|
todo				|CursorLineCurrentWindow-todo|
history				|CursorLineCurrentWindow-history|

==============================================================================
DESCRIPTION				 *CursorLineCurrentWindow-description*

The 'cursorline' setting makes it easy to locate the cursor position. However,
when there are split windows, each one shows its cursor line, and the only
indication of the currently active window is the different 'statusline'
highlighting (with |hl-StatusLine| vs. |hl-StatusLineNC|).

This plugin avoids the clutter of multiple highlighted screen lines with split
windows by disabling the 'cursorline' setting for all but the current window.

RELATED WORKS								     *

The basic idea is outlined in the Vim Tips Wiki:
    http://vim.wikia.com/wiki/Highlight_current_line

==============================================================================
USAGE					       *CursorLineCurrentWindow-usage*

Globally enable 'cursorline' in your |vimrc| via >
    :set cursorline
After sourcing this plugin, 'cursorline' will only be active for the current
window. So with multiple split windows, only one of them, the one where the
cursor is in, will have the 'cursorline'.


Disable cursorline for the current window via: >
    :setlocal nocursorline
This will persist even after moving away and back to the window.

Disable cursorline globally via: >
    :set nocursorline
As soon as you enter a window, its line highlighting will vanish.

						     *w:persistent_cursorline*
For some kind of files it is helpful to keep the line highlighting active,
e.g. to serve as a ruler. You can keep the highlighting for a particular
window by setting a window-local variable: >
    :let w:persistent_cursorline = 1

==============================================================================
INSTALLATION				*CursorLineCurrentWindow-installation*

This script is packaged as a |vimball|. If you have the "gunzip" decompressor
in your PATH, simply edit the *.vba.gz package in Vim; otherwise, decompress
the archive first, e.g. using WinZip. Inside Vim, install by sourcing the
vimball or via the |:UseVimball| command. >
    vim CursorLineCurrentWindow.vba.gz
    :so %
To uninstall, use the |:RmVimball| command.

DEPENDENCIES				*CursorLineCurrentWindow-dependencies*

- Requires Vim 7.0 or higher.

==============================================================================
LIMITATIONS				 *CursorLineCurrentWindow-limitations*

KNOWN PROBLEMS			      *CursorLineCurrentWindow-known-problems*

TODO						*CursorLineCurrentWindow-todo*

IDEAS					       *CursorLineCurrentWindow-ideas*

==============================================================================
HISTORY					     *CursorLineCurrentWindow-history*

1.00	18-Aug-2012
First published version.

0.10	23-Aug-2011
Allow persistent cursorlines via w:persistent_cursorline.

0.01	09-May-2006
Started development.

==============================================================================
Copyright: (C) 2012 Ingo Karkat
The VIM LICENSE applies to this script; see |copyright|.

Maintainer:	Ingo Karkat <ingo@karkat.de>
==============================================================================
 vim:tw=78:ts=8:ft=help:norl:
