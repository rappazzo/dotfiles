source ~/.dots/zsh/colors.zsh
source ~/.dots/zsh/setopt.zsh

source ~/.dots/zsh/git.zsh

mkdir -p ${TMPPREFIX}
source ~/.dots/zsh/prompt.zsh

source ~/.dots/zsh/completion.zsh
source ~/.dots/aliases
source ~/.dots/functions

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

set -o vi

export TOOLS_BIN=/code/tools/bin
export PATH="$TOOLS_BIN:$PATH:$HOME/.dots/bin"
source $TOOLS_BIN/.autocomplete/zsh/.install

zstyle ':completion:::git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
#fpath is the search path for function definitions
fpath=(/usr/local/share/zsh/site-functions/_git $fpath)

test -f ~/.dots/private-env && source ~/.dots/private-env

export EDITOR=/usr/local/bin/mvim
export MY_USER=mrappazzo

#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export VAGRANT_CWD=/code/gtnexus/development/modules/main/tcard/etc/vagrants/unittest
#export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk

# HISTORY
HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

#eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
export RT_USE_LOCAL=yes