# vim: syntax=bash
#
# Autocomplete bugfix:
# https://superuser.com/questions/230301/strange-zsh-autocomplete-behaviour

DEFAULT_USER='flynn'
DEFAULT_HOST='ARCHOM'

# if [ $UID -eq 0 ]; then
#     CARETCOLOR="red"
# else
#     CARETCOLOR="blue"
# fi

gold="%F{222}"
violet="%F{105}"
orange="%F{214}"
white_bold="%{${fg_bold[white]}%}"
reset="%{$reset_color%}"

machine_name() {
    context=""
    if [[ $USERNAME != "$DEFAULT_USER" ]]; then
        context+="${orange}%n${reset}@"
    fi

    if [[ $HOST != "$DEFAULT_HOST" ]]; then
        context+="${violet}%m${reset} "
    else
    fi
    echo -n "$context"
}

return_code() {
    ret_code_raw=$?
    if [[ $ret_code_raw -ne 0 && $ret_code_raw -ne 130 ]]; then
        echo -n "[%{$fg[red]%}%?${reset}] "
    else
        echo -n ""
    fi
}

PROMPT='$(return_code)$(machine_name)${gold}%2~ $(git_prompt_info)${gold}»${reset}%f '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› ${reset}"
