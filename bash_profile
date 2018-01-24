export EDITOR='vim'
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.bashrc"
command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists xboxdrv ; then
    alias controller-enable="sudo xboxdrv --detach-kernel-driver --led 2"
fi
