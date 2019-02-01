set -U fish_user_paths $fish_user_paths ~/.config/dotfiles/bin ~/.cargo/bin
set -Ux FZF_DEFAULT_COMMAND "rg -l ."
set -gx EDITOR vim
set -Ux VIMINIT 'let $MYVIMRC="~/.config/dotfiles/vimrc" | source $MYVIMRC'
