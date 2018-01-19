set_bash_prompt() {
    EXIT_STATUS=$? #Get the result of the previous command to color the lambda
    #Color constants
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

    # Variables for the prompt
    local DIRECTORY
    local DIRECTORY_PREFIX
    local HOST
    local USER

    #The current directory in Cyan color
    DIRECTORY="$CYAN\w$RESET"
    #If running over SSH, include username and hostname
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        USER="$LIGHTGRAY\u$RESET"
        HOST=" at $YELLOW\h$RESET"
        DIRECTORY_PREFIX=" in "
    fi
    #If root, the username should be in red
    if [ "$EUID" -eq 0 ]; then 
        USER="$RED\u$RESET"
        DIRECTORY_PREFIX=" in "
    fi
    #If the previous command failed, the lambda should be red
    if [ $EXIT_STATUS == 0 ]; then 
        PROMPT="$GREENλ$RESET"
    else
        PROMPT="$REDλ$RESET"
    fi
    #($user (at $host)? in)? $directory
    #$prompt 
    DIRECTORY="$DIRECTORY_PREFIX$DIRECTORY"
    PS1="\n$USER$HOST$DIRECTORY \n$PROMPT "
}
PROMPT_COMMAND=set_bash_prompt


