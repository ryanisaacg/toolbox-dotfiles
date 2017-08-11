#!/usr/bin/env python

# This script creates symlinks from the home directory to these configuration files
# If a file should be in a different location edit the 'special' dictionary
# By default a '.' is prepended and the file is put in the home directory
# If a file should be ignored edit the 'ignore' list
import os

special = { 'init.nvim': '~/.config/nvim/init.vim' }
ignore = ['.git', 'init.py']

for file in os.listdir('.'):
    if file in ignore:
        continue
    if file in special.keys():
        dest = special[file]
    else:
        dest = '~/.{}'.format(file)
    dest = os.path.expanduser(dest)
    os.symlink(os.path.abspath(file), os.path.abspath(dest))
