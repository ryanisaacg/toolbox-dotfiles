export GOPATH=$HOME/go
export PATH=$HOME/bin:$HOME/go/bin:/usr/local/bin:$PATH
export EDITOR='vim'
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists xboxdrv ; then
    alias controller-enable="sudo xboxdrv --detach-kernel-driver --led 2"
fi

if [ ! -f "$HOME/antigen.zsh" ]; then
    curl -L git.io/antigen > "$HOME/antigen.zsh"
fi

# Load the Anitgen package manager
source ~/antigen.zsh
antigen bundle git
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
antigen apply

SPACESHIP_PROMPT_SYMBOL="λ"
