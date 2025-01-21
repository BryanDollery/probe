#!/bin/bash

##############################################################################
#
# Provides logging functions, and ansi colour functions for the terminal
#
# The LOG_LEVEL environment variable is respected by this script. Logs are 
# done like this:
#
#   log "Info: This is an info message"
#
# or
#
#   log "Error: This is an error message"
#
# The log level itself will be coloured apprpriately. Other colours may be used
# in the terminal output too.
#
# Colours are equally simple. For example:
#
#   echo -e "This isn't red, $(red but this is), while this is $(blue blue)"
#
# or
#
#   log "Error: Folder $(orange "$path"), not found"
#
# This will be printed in standard log format with a full timestamp, the word, 
# "Error" in red, and the missing path in orange.
#
# After the colour function mame ('red', 'blue', 'green', etc) you may use quotes, 
# or not, as you prefer, but symbols can be a bit tricky so only leave off the quotes
# for very simple strings
#
##############################################################################



#########################################
#
# Directives
#
#########################################


# shellcheck disable=SC2155

#########################################
#
# Colours
#
#########################################

declare -A colors

declare end="\e[0m"
declare m="m"

clr () {
  # shellcheck disable=SC2028
  echo "\e[38;2;$1;$2;$3$m"
}

encolor () {
  local a=$1
  shift
  local b="$*"
  echo "${colors[$a]}$b$end"
}

colorfy () {
  local input="$1"
  local output=""
  while IFS= read -r line; do
    if [[ $line == \##* ]]; then
      line=$(lightorange "$line")
    fi
    if [[ $line == \#* ]]; then
      line=$(orange "$line")
    fi
    output+="$line"$'\n'
  done <<< "$input"
  echo "$output"
}

colors[pink]=$(clr 255 150 150)

colors[red]=$(clr 255 59 59)
colors[lightred]=$(clr 255 127 127)
colors[darkred]=$(clr 127 0 0)

colors[orange]=$(clr 255 127 0)
colors[lightorange]=$(clr 255 200 50)
colors[darkorange]=$(clr 127 100 0)

colors[yellow]=$(clr 255 255 0)
colors[lightyellow]=$(clr 255 255 150)
colors[darkyellow]=$(clr 127 127 0)

colors[green]=$(clr 50 255 50)
colors[lightgreen]=$(clr 127 255 127)
colors[darkgreen]=$(clr 0 127 0)

colors[cyan]=$(clr 50 255 255)
colors[lightcyan]=$(clr 127 255 255)
colors[darkcyan]=$(clr 0 127 127)

colors[blue]=$(clr 50 50 255)
colors[lightblue]=$(clr 127 127 255)
colors[darkblue]=$(clr 0 0 127)

colors[magenta]=$(clr 255 50 255)
colors[lightmagenta]=$(clr 255 127 255)
colors[darkmagenta]=$(clr 127 0 127)

colors[black]=$(clr 0 0 0)
colors[white]=$(clr 255 255 255)

colors[grey]=$(clr 127 127 127)
colors[gray]=$(clr 127 127 127)
colors[grey20]=$(clr 50 50 50)
colors[gray20]=$(clr 50 50 50)
colors[grey40]=$(clr 100 100 100)
colors[gray40]=$(clr 100 100 100)
colors[grey60]=$(clr 150 150 150)
colors[gray60]=$(clr 150 150 150)
colors[grey80]=$(clr 200 200 200)
colors[gray80]=$(clr 200 200 200)

colors[watchmen]=$(clr 255 204 0)


pink () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

red () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
lightred () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
darkred () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

orange () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
lightorange () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
darkorange () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

yellow () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
lightyellow () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
darkyellow () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

green () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
lightgreen () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
darkgreen () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

cyan () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
lightcyan () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
darkcyan () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

blue () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
lightblue () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
darkblue () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

magenta () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
lightmagenta () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
darkmagenta () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

black () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
white () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

grey () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
gray () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
grey20 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
gray20 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
grey40 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
gray40 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
grey60 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
gray60 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
grey80 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }
gray80 () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

watchmen () { echo "$(encolor "${FUNCNAME[0]}" "$@")"; }

export -f pink

export -f red
export -f lightred
export -f darkred

export -f orange
export -f lightorange
export -f darkorange

export -f yellow
export -f lightyellow
export -f darkyellow

export -f green
export -f lightgreen
export -f darkgreen

export -f cyan
export -f lightcyan
export -f darkcyan

export -f blue
export -f lightblue
export -f darkblue

export -f magenta
export -f lightmagenta
export -f darkmagenta

export -f black
export -f white

export -f grey
export -f gray
export -f grey20
export -f gray20
export -f grey40
export -f gray40
export -f grey60
export -f gray60
export -f grey80
export -f gray80

export -f watchmen

#########################################
#
# Logging Functions
#
#########################################

## Add the timestamp and colours and then logs the message to the terminal
function _log {
  local output="${1//robot/$(watchmen Robot)}"
  output="${output//[Ee]rror /$(red "ERROR ")}"
  output="${output//[Ww]arn /$(yellow "WARN  ")}"
  output="${output//[Ii]nfo /$(blue "INFO  ")}"
  output="${output//[Dd]ebug /$(orange "DEBUG ")}"
  ts=$(date -u +"$(gray "%Y-%m-%d")$(gray40 T)$(darkcyan %H)$(gray40 "-")$(cyan %M:%S)$(gray40 Z)")
  echo -e "$(gray40 "[")$ts$(gray40 "]") $output"
} 

function info {
  local level="$1"
  local msg="$2" 
 
  if [[ "$level" != "Debug" ]]; then
    _log "$msg"
  fi
}

function warn {
  local level="$1"
  local msg="$2"

  if [[ "$level" != "Debug" && "$level" != "Info" ]]; then
    _log "$msg"
  fi
}

function error {
  local level="$1"
  local msg="$2" 

  if [[ "$level" == "Error" ]]; then
    _log "$msg"
  fi
}

log() {
  [[ -z "$LOG_LEVEL" ]] && LOG_LEVEL="DEBUG" # Default to debugging on

  local msg="$1"
  local level="${1%% *}" # First word of the message
  
  # if $level ends with a colon, remove it
  if [[ "$level" =~ : ]]; then
    level="${level%:}"      # Remove trailing colon
    msg="$level ${msg#* }"         # Remove first word and add the level back in
    
  fi


  local levelLowercase=$(echo "$level" | tr '[:upper:]' '[:lower:]')
  local levels="debuginfowarnerror"

  if [[ ! "$levels" =~ $levelLowercase ]]; then
    level="Debug"
    msg="debug $msg"
  fi

  if [[ "$LOG_LEVEL" == "INFO" ]]; then 
    info "$level" "$msg"
  elif [[ "$LOG_LEVEL" == "WARN" ]]; then 
    warn "$level" "$msg"
  elif [[ "$LOG_LEVEL" == "ERROR" ]]; then 
    error "$level" "$msg"
  else
    _log "$msg"
  fi
}

print() {
  robot="${*//robot/$(watchmen Robot)}"
  
  echo -e "$robot"
}

export -f log
export -f print