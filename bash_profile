export EDITOR='vim'
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.bashrc"
command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists xboxdrv ; then
    alias controller-enable="sudo xboxdrv --detach-kernel-driver --led 2"
fi
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:"$ANDROID_HOME/platform-tools":"$ANDROID_HOME/tools"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
