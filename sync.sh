!/bin/bash

# Copy selected dotfiles from configs list and .Xresources

configs='nano polybar i3 mimeapps.list'

for config in $configs
do
	rsync ~/.config/$config	~/git/dotfiles/.config/ -ruvhP
	echo "opa"
done

rsync ~/.Xresources	~/git/dotfiles/ -ruvhP &&
rsync ~/.zshrc	~/git/dotfiles/ -ruvhP
