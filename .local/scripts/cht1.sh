#!/usr/bin/env bash


selectedLanguage=$(cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf)
if [[ -z $selectedLanguage ]]; then
  echo "No language or command selected."
  exit 0
fi

read -p "Enter Query: " userQuery
if [[ -z $userQuery ]]; then
  echo "Query cannot be empty."
  exit 1
fi

if grep -qs "$selectedLanguage" ~/.tmux-cht-languages; then
  # Escape spaces in the user query for URL construction
  userQuery=$(echo "$userQuery" | tr ' ' '+')
  # Send the query to cht.sh in the background and pipe it to less
  tmux neww bash -c "curl cht.sh/$selectedLanguage/$userQuery/ & cat /dev/null > /dev/tty; curl cht.sh/$selectedLanguage/$userQuery | less"
else
  if grep -qs "$selectedLanguage" ~/.tmux-cht-command; then
    tmux neww bash -c "curl -s cht.sh/$selectedLanguage~$userQuery | less"
  else
    echo "Selected language or command not supported."
    exit 2
  fi
fi

