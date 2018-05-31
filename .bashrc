# -*- sh -*-

# Enviroment Variables
set -o vi
export EDITOR="/usr/local/bin/vim"
export CVSEDITOR="/usr/local/bin/vim"
export CVS_RSH="ssh"
export SVN_EDITOR="/usr/local/bin/vim"
export GIT_EDITOR="/usr/local/bin/vim"
export LC_CTYPE=en_US.UTF-8
export HISTSIZE=500
export HISTFILESIZE=1500
export HISTCONTROL=erasedups:ignorespace
export PROMPT_COMMAND='history -a'  # write previous line as prompt is displayed
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export AWS_REGION=us-east

# Path
export PATH="~/.rbenv/shims:/Users/tim/bin:/Users/tim/scratch/cli/todo/bin:$PATH"

. ~/.bash_aliases

export RED='\[\e[1;31m\]'
export YELLOW='\[\e[1;33m\]'
export GREEN='\[\e[1;32m\]'
export PS1="$RED`gshead`$YELLOW \w \[\e[m\]$RED\n:>$GREEN"


eval "$(rbenv init -)"
function get_todo_commands()
{
  if [ -z $2 ] ; then
    COMPREPLY=(`todo help -c`)
  else
    COMPREPLY=(`todo help -c $2`)
  fi
}
complete -F get_todo_commands todo


export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
shopt -s lithist

source ~/.private_variables


 alias port='function _blah(){ export ICFP_PORT=$1; };_blah'

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
