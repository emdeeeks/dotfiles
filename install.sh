#!/usr/bin/env bash

# TODO:
# Install ruby / rvm here
# pass off to ruby for rest of install, mabye using <<< RUBY

function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; exit; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

desktop_apps_to_install=(
    nginx
    redshift
    httpie
    glances
    qutebrowser 
    rofi
    nginx
    mysql-server
    mysql-client
    neomutt
    xfonts-terminus
    mpv
    wicd
    wicd-curses
    ruby-railties
)

server_apps_to_install=(
)

global_apps_to_install=(
    lnav
    tmux
    zsh
    rxvt-unicode
    neovim
    python-pip
    npm
    net-tools
    tig
    nodejs
    cargo
)

setup () {
    if ! [ -e $HOME/dotfiles ]; then
        e_arrow "Setting up"
        mkdir $HOME/dotfiles
        git clone https://github.com/synbyte/dotfiles.git $HOME/dotfiles
    else
	# check .git exists first. Exit otherwise
        cd $HOME/dotfiles
        e_arrow "Already installed. Updating"
        git pull origin master
    fi
}

create_symlinks() {
    for f in `ls -A $HOME/dotfiles/bin`; do
        e_arrow "symlinking binary $f"
        sudo ln -s $HOME/dotfiles/bin/$f /usr/local/bin/ -f
    done

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
        ln -s $HOME/dotfiles/home/$f $HOME/ -f
    done
}

install_applications() {
    if [ $DISPLAY ]; then
        for app in ${desktop_apps_to_install[@]}; do
            e_arrow "Installing $app"
            which $app 2>&1 >/dev/null || sudo apt-get install -y $app
        done
    else
        for app in ${server_apps_to_install[@]}; do
            e_arrow "Installing $app"
            which $app 2>&1 >/dev/null || sudo apt-get install -y $app
        done
    fi

    for app in ${global_apps_to_install[@]}; do
        e_arrow "Installing $app"
        which $app 2>&1 >/dev/null || sudo apt-get install -y $app
    done

}

setup
install_applications
create_symlinks

e_success 'All done!'

#setup default apps
#remove all display managers and use .xinitrc
# make grub text only
#dpkg-reconfigure xserver-xorg-legacy add 'anyone' to users to startx

#setup terminal
# install urxvt and then `sudo update-alternatives --config x-terminal-emulator

# Peerflix
#npm install -g peerflix

# Oh my ZSH
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Youtube-dl
#curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

# defaults
sudo update-alternatives --config x-terminal-emulator
sudo update-alternatives --config x-www-browser
sudo update-alternatives --config x-window-manager
sudo update-alternatives --config editor

# RVM
#gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
#curl -sSL https://get.rvm.io | bash -s stable --ruby
#source ~/.rvm/scripts/rvm
#rvm install ruby-2.5.3


# Bash-it
#git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
#~/.bash_it/install.sh --silent


#gem install bundler after railties


#cargo install exa
