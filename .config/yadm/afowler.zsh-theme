# vim: syntax=bash

DEFAULT_HOST='ARCHOM'

if [ $UID -eq 0 ]; then
    CARETCOLOR="red"
else
    CARETCOLOR="blue"
fi

if [[ $HOST != "$DEFAULT_HOST" ]]; then
    machine_name='%m '
else
    machine_name=''
fi

local return_code="%(?..[%{$fg[red]%}%?%{$reset_color%}] )"

PROMPT='${return_code}${machine_name}%{${fg_bold[blue]}%}%{$reset_color%}%{${fg[blue]}%}%3~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
