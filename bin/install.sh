#!/usr/bin/env bash

function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; exit; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

apps_to_install=(
	nginx
	weechat
	vim
)

setup () {
	if ! [ -e $HOME/dotfiles ]; then
		e_arrow "Setting up"
		mkdir $HOME/dotfiles
		git clone https://github.com/synbyte/dotfiles.git $HOME/dotfiles
	else
		cd $HOME/dotfiles
		e_arrow "Already installed. Updating"
		git pull origin master
	fi
}

create_symlinks() {
	if ! [ -e $HOME/dotfiles.old ]; then
		mkdir $HOME/dotfiles.old
		e_success "Created ~/dotfiles.old"
	fi

	for f in `ls -A $HOME/dotfiles/home`; do
		if [ -e $HOME/$f ]; then
			e_arrow "Moving ~/$f to ~/dotfiles.old/$f"
			mv $HOME/$f $HOME/dotfiles.old/ -u
		fi

		e_arrow "symlinking $f"
		ln -s $HOME/dotfiles/home/$f $HOME/
	done
}

present() { 
	which $1 2>&1 >/dev/null; 
}

install_applications() {
	for app in ${apps_to_install[@]}; do
		e_arrow "Installing $app"
		which $app 2>&1 >/dev/null || sudo apt-get install -y $app
	done
}

setup
create_symlinks
install_applications

e_success 'All done!'
