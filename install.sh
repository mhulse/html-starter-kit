#!/bin/bash

# Install files:
function install() {
	
	echo "Installing into “${1}” …"
	
	# Create installation folder:
	mkdir -pv $1
	
	cd $1
	
	# Remote repo zip file:
	SOURCE_ZIP="https://github.com/mhulse/html-starter-kit/tarball/gh-pages"
	
	# Get the zip file and extract all files:
	curl -sS -#L "$SOURCE_ZIP" | tar -xzv --strip-components 1 --exclude={install.sh,.*}
	
	echo "# My new project"$'\n' > README.md
	
	# Let the use know that we are done:
	echo $'\n'"Congrats! Installation was successful!"$'\n'
	
	# Open installation folder:
	open "."
	
}

# Check if installation directory meets our requirements:
function empty() {
	
	if [ -d "$DIRECTORY" ] && [ "$(ls -A $1)" ]; then
		# If chosen directory exists, and it’s not empty:
		echo "“$1” must be an empty directory."
		echo "Please try running this script again."
	else
		# Move on to the installation function:
		install $1
	fi
	
}

# Pre-installation options:
function menu() {
	
	echo "Enter path to an empty installation directory from current location."
	echo "This script will create path if it does not already exist."$'\n'
	
	# Prompt the user for feedback:
	read -p "Enter installation directory path (Q to quit): " input
	
	# Check the user’s input:
	case $input in
		[qQ])
			# User cancled:
			echo "Cancled by user, exiting …"
			;;
		*[![:blank:]]*)
			# Not blank or empty and is set:
			empty $input
			;;
		*)
			# Contains only blanks, is empty or unset:
			echo $'\n'"You must enter a directory path."
			echo "Please try running this script again."
	esac
}

# Tidy up the terminal window:
clear

# Create menu:
menu

# Exit program:
exit 0

# Done!
# For more information about this script, see:
# https://github.com/mhulse/html-starter-kit
