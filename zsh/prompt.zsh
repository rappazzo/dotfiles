
_fishy_collapsed_wd() {
  echo $(pwd | perl -pe "
   BEGIN {
      binmode STDIN,  ':encoding(UTF-8)';
      binmode STDOUT, ':encoding(UTF-8)';
   }; s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g
")
} 

function git_prompt_info() {
   # BLUE:     [
   # YELLOW:   Branch name OR short rev id if headless
   # BLUE:     ]
   #
   if [ -e .git ] || git rev-parse --git-dir >/dev/null 2>&1; then
      local ref
      ref=$(git symbolic-ref -q --short HEAD || git rev-parse --short HEAD) 2>/dev/null
      echo " %{$fg[blue]%}[%{$reset_color%}%{$fg[yellow]%}${ref}%{$reset_color%}%{$fg[blue]%}]%{$reset_color%}"
   fi 
}

PROMPT='%{$fg[cyan]%}$(_fishy_collapsed_wd)%{$reset_color%}$(git_prompt_info) %B%F{green}❯%F{yellow}❯%F{blue}❯%f%b '
RPROMPT='%{$fg[red]%}%(?..⏎)%{$reset_color%}'

function zle-keymap-select {
   MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
   case $KEYMAP in
      vicmd) MODE_CHAR="❮";;
      viins|main) MODE_CHAR="❯";;
   esac
   PROMPT='%{$fg[cyan]%}$(_fishy_collapsed_wd)%{$reset_color%}$(git_prompt_info) %B%F{green}${MODE_CHAR}%F{yellow}${MODE_CHAR}%F{blue}${MODE_CHAR}%f%b '
   zle reset-prompt
}

function setup_prompts {
   function async-rprompt {
      echo -ne "\e]1;$(_fishy_collapsed_wd)\a"
      if [ -e .git ] || git rev-parse --git-dir >/dev/null 2>&1; then
         git_stat_info=$(git_prompt_status)
         gradle-check --no-invoke >/dev/null 2>&1
         gradle_stat=$?
         if [[ ${gradle_stat} > 0 && ${gradle_stat} != 127 && ${gradle_stat} != 92 ]]; then
            gradle_info=" 🐘"
         fi
         RPROMPT="%{$fg[red]%}%(?..⏎)%{$reset_color%}${git_stat_info}${gradle_info}%{$reset_color%}"

         # Save the prompt in a temp file so the parent shell can read it.
         printf "%s" $RPROMPT >${TMPPREFIX}/prompt.$$

         # Signal the parent shell to update the prompt.
         kill -s USR2 $$
      else
         RPROMPT="%{$fg[red]%}%(?..⏎)%{$reset_color%}"
         printf "%s" $RPROMPT >${TMPPREFIX}/prompt.$$
         kill -s USR2 $$
      fi
   }

   # for async RPROMPT
   function TRAPUSR2 {
      if [[ -e "${TMPPREFIX}/prompt.$$" ]]; then
         RPROMPT=$(cat "${TMPPREFIX}/prompt.$$")

         # Force zsh to redisplay the prompt.
         zle && zle reset-prompt
      fi
   }

   # Build the prompt in a background job.
   async-rprompt &!
}

[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions setup_prompts)
zle -N zle-keymap-select

