#!/bin/bash

# Copy selected dotfiles from configs list and .Xresources

configs='alacritty mpv nano polybar i3'

for config in $configs
do
	rsync ~/.config/$config	~/git/dotfiles/.config/ -rvhP
	echo "opa"
done

rsync ~/.Xresources	~/git/dotfiles/ -rvhP &&
rsync ~/.zshrc	~/git/dotfiles/ -rvhP
