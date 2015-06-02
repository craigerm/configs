# Remaps tmux prefix to Control-b
unbind C-b
set -g prefix C-a

# Improve colors
set -g default-terminal 'screen-256color'

# Navigate around panes easily using vim-like keybindings
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Remove administrative debris (session name, hostname, time) in status bar
#set -g status-left ''
#set -g status-right ''
