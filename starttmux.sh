#!/bin/sh
#
# Setup a work space called `work` with 1 windows
# First window is 3 panes
# note: `workspace` to point to '~/path/to/work`
#
session="work"
workspace="${PWD}"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/insert_name"

# Select pane 1, set dir to workspace, run vim
tmux selectp -t 0 
tmux send-keys "cd $workspace; vim" C-m

# Split pane 1 horizontally by 70%, open shell in workspace
tmux splitw -h -p 30
tmux send-keys "cd $workspace" C-m

# Select pane 2 
tmux selectp -t 1
# Split pane 2 vertiacally by 25%
tmux splitw -v -p 75

# select pane 3, set to api root
tmux selectp -t 2
tmux send-keys "cd $workspace" C-m 

# Select pane 1
tmux selectp -t 0

# create a new window called scratch if needed
#tmux new-window -t $session:1 -n scratch

# return to main vim window
#tmux select-window -t $session:0

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
