#!/usr/bin/env python

# This script creates symlinks from the home directory to these configuration files
# If a file should be in a different location edit the 'special' dictionary
# By default a '.' is prepended and the file is put in the home directory
# If a file should be ignored edit the 'ignore' list
import os

special = { 'init.nvim': '~/.config/nvim/init.vim' }
ignore = ['.git', 'init.py']

#Ensure compatibility between Python 2 and 3
try:
    input = raw_input
except:
    pass

for config in os.listdir('.'):
    if config in ignore:
        continue
    if config in special.keys():
        dest = special[config]
    else:
        dest = '~/.{}'.format(config)
    dest = os.path.expanduser(dest)
    config = os.path.abspath(config)
    dest = os.path.abspath(dest)
    if os.path.exists(dest):
        if input("Configuration destination {} for configuration {} already exists. Overwrite? (Y/N) ".format(dest, config)) == 'Y':
            os.remove(dest)
        else:
            continue
    os.symlink(config, dest)
