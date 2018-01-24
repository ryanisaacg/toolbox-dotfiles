#Color constants
__set_prompt() { 
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

    __git_info() { 
        readonly SYMBOL_GIT_BRANCH=''
        readonly SYMBOL_GIT_MODIFIED='?'
        readonly SYMBOL_GIT_PUSH='↑'
        readonly SYMBOL_GIT_PULL='↓'
        [[ $POWERLINE_GIT = 0 ]] && return # disabled
        hash git 2>/dev/null || return # git not found
        local git_eng="env LANG=C git"   # force git output in English to make our work easier

        # get current branch name
        local ref=$($git_eng symbolic-ref --short HEAD 2>/dev/null)

        if [[ -n "$ref" ]]; then
            # prepend branch symbol
            ref="$SYMBOL_GIT_BRANCH $ref"
        else
            # get tag name or short unique hash
            ref=$($git_eng describe --tags --always 2>/dev/null)
        fi

        [[ -n "$ref" ]] || return  # not a git repo

        local marks

        # scan first two lines of output from `git status`
        while IFS= read -r line; do
            if [[ $line =~ ^## ]]; then # header line
                [[ $line =~ ahead\ ([0-9]+) ]] && marks+="$SYMBOL_GIT_PUSH"
                [[ $line =~ behind\ ([0-9]+) ]] && marks+="$SYMBOL_GIT_PULL"
            else # branch is modified if output contains more lines after the header line
                marks="$SYMBOL_GIT_MODIFIED$marks"
                break
            fi
        done < <($git_eng status --porcelain --branch 2>/dev/null)  # note the space between the two <
        if [[ -n "$marks" ]]; then 
            marks="[$marks]"
        fi

        # print the git branch segment without a trailing newline
        printf " on $PURPLE$ref $marks$RESET"
    }

    set_bash_prompt() {
        EXIT_STATUS=$? #Get the result of the previous command to color the lambda

        # Variables for the prompt
        local DIRECTORY
        local DIRECTORY_PREFIX
        local HOST
        local USER
        local PROMPT="λ$RESET"

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
            PROMPT="$GREEN$PROMPT"
        else
            PROMPT="$RED$PROMPT"
        fi
        #($user (at $host)? in)? $directory
        #$prompt 
        DIRECTORY="$DIRECTORY_PREFIX$DIRECTORY"
        __powerline_git_info="$(__git_info)"
        local GIT="\${__powerline_git_info}"
        PS1="\n$USER$HOST$DIRECTORY$GIT\n$PROMPT "
    }
    PROMPT_COMMAND=set_bash_prompt
}
__set_prompt

export EDITOR='vim'

command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists xboxdrv ; then
    alias controller-enable="sudo xboxdrv --detach-kernel-driver --led 2"
fi
