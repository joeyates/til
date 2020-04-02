# Cookbook

## Run multiple commands

run a shell

foo | xargs -I{} bash -c 'command1 | command2'
