export EDITOR=/usr/local/bin/mvim
export MY_USER=mrappazzo
#export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
set -o vi
. ~/.dots/aliases
. ~/.dots/functions

# BASH specific
. `brew --prefix`/etc/bash_completion.d/git-completion.bash

# Show branch in status line
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
PURPL="\[\033[0;34m\]"
PINK="\[\033[1;35m\]"
BLUE="\[\033[0;36m\]"
WHITE="\[\033[0;39m\]"

PS1="$BLUE\$(date +%H:%M) $BLUE\w$YELLOW \$(parse_git_branch)$WHITE\n$ $BLUE"
source $TOOLS_BIN/.autocomplete/bash/.install
#PS1="$RED\$(date +%H:%M) \W$YELLOW \$(parse_git_branch)"
#PS1='\w$(__git_ps1 " (%s)")\$ '

# Added by install_latest_perl_osx.pl
#[ -r /Users/mike/.bashrc ] && source /Users/mike/.bashrc
#source /Users/mike/perl5/perlbrew/etc/bashrc
export RT_USE_LOCAL=yes


export PATH="$HOME/.poetry/bin:$PATH"
