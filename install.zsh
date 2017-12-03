#!/usr/bin/env zsh

# Variables

dir="/home/blabel/.dotfiles"
subdir="/interface"

# Create symlinks
echo $dir$subdir

for file in $(find -H .$subdir -maxdepth 2 -type f | sed 's|./interface||'); do
	echo "Creating symlink to $file."
	echo $dir$subdir$file ~/.config$file
	ln -sf $dir$subdir$file ~/.config$file
done

