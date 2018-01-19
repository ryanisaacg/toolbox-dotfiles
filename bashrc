set_bash_prompt() {
    EXIT_STATUS=$?
    RED='\033[00;31m'
    GREEN='\033[00;32m'
    YELLOW='\033[00;33m'
    BLUE='\033[00;34m'
    PURPLE='\033[00;35m'
    CYAN='\033[00;36m'
    LIGHTGRAY='\033[00;37m'

    LRED='\033[01;31m'
    LGREEN='\033[01;32m'
    LYELLOW='\033[01;33m'
    LBLUE='\033[01;34m'
    LPURPLE='\033[01;35m'
    LCYAN='\033[01;36m'
    WHITE='\033[01;37m'

    RESET='\e[m'

    USER="$YELLOW\u$RESET"
    HOST="$LIGHTGRAY\h$RESET"
    DIRECTORY="$CYAN\w$RESET"
    local PROMPT
    if [ $EXIT_STATUS == 0 ]; then 
        PROMPT="$GREENλ$RESET"
    else
        PROMPT="$REDλ$RESET"
    fi
    PS1="$USER at $HOST in $DIRECTORY \n$PROMPT "
}
PROMPT_COMMAND=set_bash_prompt


