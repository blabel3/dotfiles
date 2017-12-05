#!/usr/bin/env zsh

# Variables

dir=~/dotfiles/
declare -a subdirs=("./interface" "./graphics")

# Create symlinks in config for specified subdirectories


for subdir in ${subdirs[@]}; do

	for file in $(find -H $subdir -maxdepth 2 -type f | sed "s|$subdir||"); do
		echo "Creating symlink in ~/.config to $file ..."
		# echo $dir$subdir$file --- ~/.config$file
		ln -sf $dir$subdir$file ~/.config$file
	done

done

echo "Done!"
