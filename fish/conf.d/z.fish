if type -q lua
    source (lua ~/.config/dotfiles/bin/z.lua --init fish | psub)
else
    echo "Lua not found, z.lua not enabled"
end
