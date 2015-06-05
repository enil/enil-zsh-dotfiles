#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd) && cd $DIR
FILES=".zsh .zshrc"
OS_CONFIG_FILE=.zshrc.$(uname -s | tr "[:upper:]" "[:lower:]")
[ -f $OS_CONFIG_FILE ] && FILES="$OS_CONFIG_FILE $FILES"

if which git &> /dev/null; then
	git submodule init && git submodule update || exit $?
else
	echo "git not found, not installing submodules" 1>&2
fi

for file in $FILES; do
	 ln -siFn $DIR/$file $HOME/$file
done

