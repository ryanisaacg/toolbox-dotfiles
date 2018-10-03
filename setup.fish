ln -s (pwd)/functions ~/.config/fish/functions
ln -s (pwd)/gitconfig ~/.gitconfig
ln -s (pwd)/gitignore_global ~/.gitignore_global
ln -s (pwd)/vimrc ~/.config/nvim/init.vim
set -U fish_user_paths $fish_user_paths ~/.config/dotfiles/bin ~/.cargo/bin
