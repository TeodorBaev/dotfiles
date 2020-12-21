##!/bin/bash

# Copy selected dotfiles from configs list and .Xresources

#configs='nano polybar i3 mimeapps.list'

#for config in $configs
#do
#	rsync ~/.config/$config	~/code/dotfiles/.config/ -ruvhP
#done

#rsync ~/.Xresources	~/code/dotfiles/ -ruvhP &&
#rsync ~/.zshrc	~/code/dotfiles/ -ruvhP

read -p "Do you want to push to github? [Y/n] " a

if  [[ $a == "Y" || $a == "y" || $a = "" ]]
then
	git status &&
	git add . &&
	git commit -a &&
	git push
fi
	echo "done!"
