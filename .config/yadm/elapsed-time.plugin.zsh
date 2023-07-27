# Measure the elapsed time of the executed commands.
# Use `${prompt_elapsed_time}` whenever you want to know the last execution time.
#
# Inspired by:
# - https://github.com/popstas/zsh-command-time
# - https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0

zmodload zsh/datetime

_elapsed_time_preexec() {
  # check if the current command is excluded
  if [ -n "$ZSH_ELAPSED_TIME_EXCLUDE" ]; then
    cmd="$1"
    for exc ($ZSH_ELAPSED_TIME_EXCLUDE) do;
      if [ "$(echo $cmd | grep -c "$exc")" -gt 0 ]; then
        # echo "command excluded: $exc"
        return
      fi
    done
  fi

  timer=${EPOCHREALTIME}
  export ZSH_ELAPSED_TIME=""
}

_elapsed_time_precmd() {
  if [ $timer ]; then
    local -rF elapsed_realtime=$(( EPOCHREALTIME - timer ))
    local -rF s=$(( elapsed_realtime%60 ))
    local -ri elapsed_s=${elapsed_realtime}
    local -ri m=$(( (elapsed_s/60)%60 ))
    local -ri h=$(( elapsed_s/3600 ))
    if (( h > 0 )); then
      printf -v prompt_elapsed_time '%ih%im' ${h} ${m}
    elif (( m > 0 )); then
      printf -v prompt_elapsed_time '%im%is' ${m} ${s}
    elif (( s >= 10 )); then
      printf -v prompt_elapsed_time '%.2fs' ${s} # 12.34s
    elif (( s >= 1 )); then
      printf -v prompt_elapsed_time '%.3fs' ${s} # 1.234s
    else
      printf -v prompt_elapsed_time '%ims' $(( s*1000 ))
    fi
    unset timer
  else
    # Clear previous result when hitting ENTER with no command to execute
    unset prompt_elapsed_time
  fi
}

precmd_functions+=(_elapsed_time_precmd)
preexec_functions+=(_elapsed_time_preexec)
