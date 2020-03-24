#!/bin/bash
onedark_black="#282c34"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#98c379"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"

tmux set-option -g pane-active-border-style fg=$onedark_green
tmux set-option -g pane-border-style fg=$onedark_white

time_format="%R"
date_format="%d/%m/%Y"
datetime="${time_format} ${date_format}"

set-option -g status-interval 1
tmux set-option -g status-bg $onedark_black
tmux set-option -g status-bg $onedark_black
tmux set-option -g status-right "\
	#[fg=$onedark_visual_grey,bg=$onedark_visual_grey] \
	#[fg=$onedark_white, bg=$onedark_visual_grey]${datetime} \
	#[fg=$onedark_black,bg=$onedark_green,bold] #h \
"
tmux set-option -g status-left "\
	#[fg=$onedark_visual_grey,bg=$onedark_green,bold] #S #{prefix_highlight}\
"

tmux set-option -g window-status-format "\
	#[fg=$onedark_white,bg=$onedark_black] #I:#{b:pane_current_path} \
"
tmux set-option -g window-status-current-format "\
	#[fg=$onedark_white,bg=$onedark_visual_grey,nobold] #I:#{b:pane_current_path} \
"
