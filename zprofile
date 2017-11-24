command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists xmodmap && ! [["$(uname)" == "Darwin"]]; then
    xmodmap "$HOME/.speedswapper"
fi

export PATH="$HOME/.cargo/bin:$PATH"
