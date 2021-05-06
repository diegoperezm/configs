# meh. Dark Blood Rewind, a new beginning.

PROMPT=$'%{$fg[red]%}[%{$fg_bold[yellow]%}%~%{$reset_color%}%{$fg[red]%}]%{$reset_color%}%{$fg[red]%}%{$(git_prompt_info)%}%(?,,%{$fg[red]%})%{$reset_color%}
%{$fg[red]%} └>%{$reset_color%} '

PS2=$' %{$fg[red]%}|>%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[red]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%{$reset_color%}"

