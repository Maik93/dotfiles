# vim:ft=zsh ts=2 sw=2 sts=2
# af-magic.zsh-theme, modified
#
# Original author: https://github.com/andyfleming/oh-my-zsh

DEFAULT_USER='flynn'

# settings (" ↵" removed)
typeset +H return_code="%(?..%{$fg[red]%}%?%{$reset_color%})"

# colors
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"
typeset +H my_cyan="$FG[075]"
typeset +H my_green="$FG[078]"
typeset +H my_violet="$FG[105]"

# separator dashes size
function afmagic_dashes {
	local PYTHON_ENV="$VIRTUAL_ENV"
	[[ -z "$PYTHON_ENV" ]] && PYTHON_ENV="$CONDA_DEFAULT_ENV"

	if [[ -n "$PYTHON_ENV" && "$PS1" = \(* ]]; then
		echo $(( COLUMNS - ${#PYTHON_ENV} - 3 ))
	else
		echo $COLUMNS
	fi

	if [[ $RET_CODE -ne 0 ]]; then
		DASH_NUMS=$(( DASH_NUMS - ${#RET_CODE} ))

		# echo $RET_CODE > ~/ret_code
		# echo ${#RET_CODE} >> ~/ret_code
		# echo $COLUMNS >> ~/ret_code
		# echo $DASH_NUMS >> ~/ret_code
	fi

	echo $DASH_NUMS
}

# Context: user@hostname (who am I and where am I)
prompt_context() {
	if [[ -n "$SSH_CLIENT" ]]; then
	  actual_context=' $my_orange'
	else
		actual_context=' $my_gray'
	fi

  if [[ "$USER" != "$DEFAULT_USER" ]]; then
    actual_context+='%n'
  fi

	actual_context+='%m%{$reset_color%}%'
	echo -n $actual_context
}

# primary prompt
PS1='$my_gray${(l.$(afmagic_dashes)..-.)}%{$reset_color%}
$my_cyan%c$(git_prompt_info)$(hg_prompt_info) $my_violet%(!.#.»)%{$reset_color%} '
PS2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
# RPS1+=' $my_gray%n@%m%{$reset_color%}%' # original version
RPS1+="$(prompt_context)"

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" $my_cyan($my_green"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$my_cyan)%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$my_cyan($my_green"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$my_cyan)%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $my_cyan"
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
