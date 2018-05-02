"""""""""""""""
""" Setting """
"""""""""""""""


"setting colors, for compatibility with iTerm2
set t_Co=256
"setting cursor, for better cursor guiding in iTerm2
let &t_ti.="\<Esc>]1337;HighlightCursorLine=true\x7"
"let &t_te.="\<Esc>]1337;HighlightCursorLine=false\x7"
set nocompatible                  " Changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set cursorline                    "add line highlight for cursor
"set term=xterm-256color
"set cursorline
"autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
"autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
set guicursor=n-v-c:hor20,o:hor50,i-ci:hor15,r-cr:hor30,sm:hor20
"set guicursor+=n-v-c:blinkwait20-blinkon200-blinkoff200

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set ruler                         " Show cursor position.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
"set wildmode=list:longest         " Complete files like a shell.
set wildmode=longest,list

set ignorecase                    " Case-insensitive searching.
set smartcase                     " Case-sensitive if it contains a capital.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nobackup                      " Don't backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//  " Keep swap files in one location.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs.

set visualbell t_vb=  "turn off flashing when top/bottom of file is reached 

set fileformats=unix
execute pathogen#infect()
set laststatus=2
set statusline +=%{fugitive#statusline()}
set statusline+=%f                " Path to the file
set statusline+=\ -\              " Separator
set statusline+=FileType:         " Label
set statusline+=%y                " Filetype of the file
set statusline+=%l                " Current line
set statusline+=/                 " Separator
set statusline+=%L                " Total lines
""""""""""""
""" Keys """
""""""""""""
"add search clear option
map <Space> :noh<cr>
"set comment highlighting
hi Comment    cterm=bold ctermfg=black ctermbg=green  gui=NONE guifg=blue

"set appropriate column marker, for style purposes
set colorcolumn=81
"switch between tabs using shift-h, and shift-l
nnoremap <S-h> gT
nnoremap <S-l> gt

autocmd Filetype ruby source ~/.Vim/ruby-macros.vim
autocmd BufRead,BufNewFile *.mpdv    set filetype=mpdv

function! Generate_test()
  r~/vim/test_template.rb
endfunction


"command Reqm :normal irequire 'minitest/autorun'<ESC>
command! Reqm :call Generate_test()
command! Rr :normal iRequire relative ' <ESC>

map <C-n> :NERDTreeToggle<CR>
map <C-r><C-r> :VimuxRunLastCommand<CR>
nnoremap - :VimuxPromptCommand 

"xmpfilter stuff

"automatically load ctags on file write
"autocmd BufWritePost * call system("ctags -R")

set runtimepath+=/Users/tim/mpd_plugin
set runtimepath+=/Users/tim/mpd_plugin/mpc

au BufRead,BufNewFile *.ino set filetype=c

runtime macros/matchit.vim
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<F6>"
command! USE :UltiSnipsEdit
"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/MyUltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips","MyUltiSnips"]
let g:UltiSnipsEditSplit="horizontal"

set number
"let <C-r><C-"> = 'xi\"p'
map <C-r><C-l> xi"<ESC>p

set pastetoggle=<F7>
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"let &t_SI ="\<Esc>]12;purple\x7"
"let &t_EI = "\<Esc>]12;blue\x7"
"red is E31328
let &t_SI = "\<Esc>Ptmux;\<Esc>\033]PlE31328\033\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\033]PlE31328\033\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\033]PlE31328\033\\"
