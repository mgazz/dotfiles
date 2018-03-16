
#!/bin/bash
SESSION='workspace'

tmux -2 new-session -d -s $SESSION

#setup a windows
tmux new-window -t $SESSION:0 -n 'home'
tmux new-window -t $SESSION:1 -n 'go_app'
#tmux new-window -t $SESSION:2 -n 'test_scale'
tmux new-window -t $SESSION:3 -n 'my_dea'
tmux new-window -t $SESSION:4 -n 'vim'

#set env
tmux send-keys -t $SESSION:1 'cd ~/workspace/gocode/src/github.com/2magpie' C-m
#tmux send-keys -t $SESSION:2 'cd ~/workspace/gocode/src/github.com/2magpie/testscale' C-m
tmux send-keys -t $SESSION:4 'cd ~/workspace/rubycode/dea_ng' C-m

tmux send-keys -t $SESSION:1 'vim -p testnats/testnats.go first_try/first_try.go '
#tmux send-keys -t $SESSION:2 'go run testscale.go'
tmux send-keys -t $SESSION:3 './restart_dea.sh'
tmux send-keys -t $SESSION:4 'vim lib/dea'

tmux select-window -t $SESSION:3

tmux attach -t $SESSION
