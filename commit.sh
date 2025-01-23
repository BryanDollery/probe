#!/bin/bash

# shellcheck disable=SC1091
# shellcheck disable=SC2103
# shellcheck disable=SC2155
# shellcheck disable=SC2164

source log.sh &> /dev/null
source "$HOME/git/bryan/ai/baish.sh" &> /dev/null

error() {
  print "$(red Error): The robot folder is missing. $(red "\$HOME/git/ent/robot")"
	exit 1
}

bored() {
  print "$(orange Bored): Nothing to commit"
  exit
}

diff="$(git diff)"
if [[ -z "$diff" ]]; then
  diff="$(git diff --staged)"
fi
if [[ -z "$diff" ]]; then
  diff="$(git show HEAD)"
fi

[[ -z "$diff" ]] && bored
msg="$(commit "$diff")"

# Use vim to edit the commit message
# send the $msg string to vim for editting
temp_file=$(mktemp)
echo "# Please enter the message for this commit" > "$temp_file"
echo "# Lines starting with '#' will be ignored" >> "$temp_file"
echo "$msg" >> "$temp_file"
vim "$temp_file"
sed -i '/^#/d' "$temp_file"
msg=$(<"$temp_file")
rm "$temp_file"

print "$(orange Committing) $(darkgreen "$msg")"
git commit -am "$msg"

cd -
