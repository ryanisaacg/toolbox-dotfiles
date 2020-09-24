#Color constants
__set_prompt() {
    BLACK='\[\033[00;30m\]'
    RED='\[\033[00;31m\]'
    GREEN='\[\033[00;32m\]'
    YELLOW='\[\033[00;33m\]'
    BLUE='\[\033[00;34m\]'
    PURPLE='\[\033[00;35m\]'
    CYAN='\[\033[00;36m\]'
    LIGHTGRAY='\[\033[00;37m\]'

    LBLACK='\[\033[01;30m\]'
    LRED='\[\033[01;31m\]'
    LGREEN='\[\033[01;32m\]'
    LYELLOW='\[\033[01;33m\]'
    LBLUE='\[\033[01;34m\]'
    LPURPLE='\[\033[01;35m\]'
    LCYAN='\[\033[01;36m\]'
    WHITE='\[\033[01;37m\]'

    RESET='\[\e[m\]'

    SYMBOL_GIT_MODIFIED='?'
    SYMBOL_GIT_STASHED='$'
    SYMBOL_GIT_PUSH='↑'
    SYMBOL_GIT_PULL='↓'

    set_bash_prompt() {
        EXIT_STATUS=$? #Get the result of the previous command to color the lambda

        hash git 2>/dev/null || return # git not found
        local git_eng="env LANG=C git"   # force git output in English to make our work easier

        # get current branch name
        local ref=$($git_eng symbolic-ref --short HEAD 2>/dev/null)

        local GIT
        # exit if this is not a git repo
        if [[ -z "$ref" ]]; then
            GIT=""
        else
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

            # check to see if the user has any stashed changes
            if [[ -n $(${git_eng} stash list 2>/dev/null) ]]; then
                marks="${marks}${SYMBOL_GIT_STASHED}"
            fi

            if [[ -n "$marks" ]]; then
                marks="[$marks]"
            fi

            # print the git branch segment without a trailing newline
            GIT=" on $PURPLE$ref $marks$RESET"
        fi

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
            PROMPT="$LGREEN$PROMPT"
        else
            PROMPT="$RED$PROMPT"
        fi
        #($user (at $host)? in)? $directory
        #$prompt
        DIRECTORY="$DIRECTORY_PREFIX$DIRECTORY"
        PS1="\n$USER$HOST$DIRECTORY$GIT\n$PROMPT "
    }
    PROMPT_COMMAND=set_bash_prompt
}
__set_prompt
set_title() {
    echo -en "\033]0;${1}\a"
}

export VIMINIT='let $MYVIMRC="~/.config/dotfiles/vim/vimrc" | source $MYVIMRC'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

