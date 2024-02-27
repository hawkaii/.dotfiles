#!/usr/bin/env bash

languages=$(echo "golang c cpp javascript rust python" | tr ' ' '\n')
core_utils=$(echo "find xargs sed awk" | tr ' ' '\n')
selected=$(echo -e "$languages\n$core_utils"| fzf)

read -p "Enter Query: " query
if echo $languages | grep -qs $selected; then
    # tmux split-window  -p 22 -v bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') | less"
    # query=$(echo "$selected" | tr -d ' ')
    tmux neww bash -c "curl -s cht.sh/$selected/$(echo "$query" | tr ' ' '+') | less"
else
    tmux neww bash -c "curl cht.sh/$selected~$query) | less"
fi
