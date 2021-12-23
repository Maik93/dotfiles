# vim: syntax=bash
#
# Autocomplete bugfix:
# https://superuser.com/questions/230301/strange-zsh-autocomplete-behaviour

DEFAULT_HOST='ARCHOM'

if [ $UID -eq 0 ]; then
    CARETCOLOR="red"
else
    CARETCOLOR="blue"
fi

if [[ $HOST != "$DEFAULT_HOST" ]]; then
    machine_name='%{${fg_bold[yellow]}}%m '
else
    machine_name=''
fi

return_code() {
	ret_code_raw=$?
	if [[ $ret_code_raw -ne 0 && $ret_code_raw -ne 130 ]]; then
		echo -n "[%{$fg[red]%}%?%{$reset_color%}] "
	else
		echo -n ""
	fi
}

PROMPT='$(return_code)${machine_name}%{${fg_bold[blue]}%}%{$reset_color%}%{${fg[blue]}%}%2~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
