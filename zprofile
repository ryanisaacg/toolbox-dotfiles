command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists xmodmap ; then
	xmodmap "$HOME/.speedswapper"
fi
