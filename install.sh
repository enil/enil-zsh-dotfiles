#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd)
FILES=".zsh .zshrc"
for file in $FILES; do
	 ln -si $DIR/$file $HOME/$file
done

