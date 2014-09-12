# munger's ZSH Theme 

#function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo "$ZSH_THEME_GIT_PROMPT_PREFIX"${ref#refs/heads/}")$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

#bolt = "⚡"
#arrow = "➜"
#pencil = "✎"

function parse_git_dirty2 {
  git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "⚡" || echo " "
}

#off yellow:142
PROMPT='%{$fg[cyan]%}$(date +%H:%M) $FG[097]% →%{$reset_color%} '
RPROMPT='$(parse_git_dirty2)% $(git_prompt_info)%(?,,%{${fg[white]}%}[%?]%{$reset_color%} )%{$fg[cyan]%}%~%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%})%{$fg[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%})"
