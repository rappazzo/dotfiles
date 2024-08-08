source ~/.dots/zsh/colors.zsh
source ~/.dots/zsh/setopt.zsh

source ~/.dots/zsh/git.zsh

mkdir -p ${TMPPREFIX}
source ~/.dots/zsh/prompt.zsh

source ~/.dots/zsh/completion.zsh
source ~/.dots/aliases
source ~/.dots/functions

eval $(/opt/homebrew/bin/brew shellenv)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

set -o vi

if [[ -d $HOME/code/gtnexus/tools/bin ]]; then
   export TOOLS_BIN=$HOME/gtnexus/code/tools/bin
else
   export TOOLS_BIN=$HOME/code/tools/bin
fi
export PATH="$TOOLS_BIN:$PATH:$HOME/.dots/bin:$HOME/.local/bin:$HOME/.poetry/bin:$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
source $TOOLS_BIN/.autocomplete/zsh/.install

zstyle ':completion:::git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
#fpath is the search path for function definitions
fpath=(/usr/local/etc/bash_completion.d/docker /usr/local/share/zsh/site-functions/_git $fpath)

test -f ~/.dots/private-env && source ~/.dots/private-env

export EDITOR=/usr/local/bin/mvim
export MY_USER=mrappazzo

#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk

# HISTORY
HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history

source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Report CPU usage for commands running longer than 20 seconds
#REPORTTIME=20

#eval "$(perl -I$HOME/Library/perl5/lib/perl5 -Mlocal::lib)"
export PERL5LIB="/Users/mike/Library/perl5/lib/perl5"
export PERL_HOMEDIR="1"
export PERL_LOCAL_LIB_ROOT="/Users/mike/Library/perl5"
export PERL_MB_OPT="--install_base /Users/mike/Library/perl5"
export PERL_MM_OPT="INSTALL_BASE=/Users/mike/Library/perl5"

export RT_USE_LOCAL=yes

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
