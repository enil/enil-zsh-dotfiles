#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd)
FILES=".zsh .zshrc"
OS_CONFIG_FILE=.zshrc.$(uname -s | tr "[:upper:]" "[:lower:]")
[ -f $OS_CONFIG_FILE ] && FILES="$OS_CONFIG_FILE $FILES"

for file in $FILES; do
	 ln -siFn $DIR/$file $HOME/$file
done

