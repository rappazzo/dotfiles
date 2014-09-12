# mrappazzo.zsh-theme

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe "
   BEGIN {
      binmode STDIN,  ':encoding(UTF-8)';
      binmode STDOUT, ':encoding(UTF-8)';
   }; s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g
")
} 

local user_color='blue'; [ $UID -eq 0 ] && user_color='red'
PROMPT='%{$fg[cyan]%}$(_fishy_collapsed_wd)%{$reset_color%}$(git_prompt_info) %B%F{red}❯%F{yellow}❯%F{green}❯%f%b '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}[%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[blue]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg[red]%}%(?..⏎)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[blue]%}✹"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[magenta]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[yellow]%}═"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[cyan]%}◼"
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg[cyan]%}✭"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[yellow]%}⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg[yellow]%}⬇"

