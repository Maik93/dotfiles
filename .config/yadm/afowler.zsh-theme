# vim: syntax=bash
#
# Autocomplete bugfix:
# https://superuser.com/questions/230301/strange-zsh-autocomplete-behaviour

DEFAULT_USER='flynn'
DEFAULT_HOST='ARCHOM'

# Disable system virtual environment name before the shell
export VIRTUAL_ENV_DISABLE_PROMPT=1

# if [ $UID -eq 0 ]; then
#     CARETCOLOR="red"
# else
#     CARETCOLOR="blue"
# fi

gold="%F{222}"
violet="%F{105}"
orange="%F{214}"
green="%F{green}"
white_bold="%{${fg_bold[white]}%}"
gray="%F{239}"
reset="%{$reset_color%}"

# Bell for long-running commands (no extra output, just bell)
LONG_CMD_THRESHOLD=20
zmodload zsh/datetime

preexec() {
  CMD_START_TIME=$EPOCHSECONDS
}

precmd() {
  if [[ -n $CMD_START_TIME ]]; then
    local duration=$((EPOCHSECONDS - CMD_START_TIME))
    if (( duration > LONG_CMD_THRESHOLD )); then
      print -n '\a'
    fi
    unset CMD_START_TIME
  fi
}

machine_name() {
    context=""
    if [[ $USERNAME != "$DEFAULT_USER" ]]; then
        context+="${orange}%n${reset}@"
    fi

    if [[ $HOST != "$DEFAULT_HOST" ]]; then
        context+="${violet}%m${reset}"
    else
    fi
    echo -n "$context"
}

current_clock() {
	echo -n "${gray}[%D - %T]${reset}"
}

return_code() {
    ret_code_raw=$?
    if [[ $ret_code_raw -ne 0 && $ret_code_raw -ne 130 ]]; then
        echo -n "[%{$fg[red]%}%?${reset}] "
    else
        echo -n ""
    fi
}

elapsed_time() {
	echo -n "${gray}${prompt_elapsed_time}${reset} "
}

venv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
      env_name=$VIRTUAL_ENV
    elif [[ -n $CONDA_DEFAULT_ENV ]]; then
      env_name=$CONDA_DEFAULT_ENV
    else
      return
    fi
		echo -n "${green}${ZSH_THEME_VIRTUALENV_PREFIX=}${env_name:t:gs/%/%%} 🐍${ZSH_THEME_VIRTUALENV_SUFFIX=}${reset} "
}

PROMPT='${gold}╭─${reset} $(return_code)$(elapsed_time)${gold}%~ $(git_prompt_info)$(venv_info)$(current_clock)
${gold}╰─${reset} $(machine_name) ${gold}»${reset}%f '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› ${reset}"
