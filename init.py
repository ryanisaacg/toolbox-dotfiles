#!/usr/bin/env python

# This script creates symlinks from the home directory to these configuration files
# If a file should be in a different location edit the 'special' dictionary
# By default a '.' is prepended and the file is put in the home directory
# If a file should be ignored edit the 'ignore' list
import os
import sys

special = { \
    'init.nvim': '~/.config/nvim/init.vim',
    'config.fish': '~/.config/fish/config.fish',
    'fish_prompt.fish': '~/.config/fish/functions/fish_prompt.fish',
    'git-switch': '~/bin/git-switch',
    'git-sprout': '~/bin/git-sprout',
    'git-state': '~/bin/git-state'
}
ignore = ['.git', 'init.py', 'colors.itermcolors']

#Ensure compatibility between Python 2 and 3
try:
    input = raw_input
except NameError:
    pass

# Compatibility shim for windows
if os.name == 'nt':
    import shutil
    os.symlink = shutil.copy

def find_dest(src):
    dest = special[src] if src in special.keys() else '~/.' + src
    return os.path.expanduser(dest)

if len(sys.argv) > 1:
    sources = sys.argv[1:]
else:
    sources = [src for src in os.listdir('.') if not src in ignore]
destinations = [find_dest(src) for src in sources]
absolute = [(os.path.abspath(src), os.path.abspath(dest)) for (src, dest) in zip(sources, destinations)]

for (src, dest) in absolute:
    if os.path.exists(dest):
        if input("Overwrite {} with a link to {}? (Y/N) ".format(dest, src)) == 'Y':
            os.remove(dest)
        else:
            continue
    os.symlink(src, dest)
