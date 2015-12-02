# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git battery taskwarrior systemadmin emoji-clock colorize colored-man git-flow composer)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

if [[ -z "$SSH_CLIENT" ]]; then
        prompt_host="%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}"
else
        prompt_host=%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$([hostname -s])
fi

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#export TERM=xterm-256color # This makes VIM look like dogs dinner

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0151515" #black
    echo -en "\e]P1cc6666" #darkred
    echo -en "\e]P2B5BD68" #darkgreen
    echo -en "\e]P3F0C674" #brown
    echo -en "\e]P481A2BE" #darkblue
    echo -en "\e]P5B294BB" #darkmagenta
    echo -en "\e]P68ABEB7" #darkcyan
    echo -en "\e]P7CCCCCC" #lightgrey
    echo -en "\e]P8969896" #darkgrey
    echo -en "\e]P9cc6666" #red
    echo -en "\e]PAB5BD68" #green
    echo -en "\e]PBf0c674" #yellow
    echo -en "\e]PC81A2BE" #blue
    echo -en "\e]PDB294BB" #magenta
    echo -en "\e]PE8ABEB7" #cyan
    echo -en "\e]PFf5f5f5" #white
    clear # Fills terminal with base color
fi

countdown() {
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ls --group-directories-first -lah
  else
    builtin cd ~ && ls --group-directories-first -lah
  fi
}

down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}

alias cdh="cd ~"
alias cds="cd ~/Sites"
alias family="mpv https://www.arconai.tv/fg/"
alias adad="mpv https://www.arconai.tv/amerro/"
alias movie="mpv https://www.arconai.tv/moovaye/"
alias simpsons="mpv https://www.arconai.tv/s/"
alias curb="mpv https://www.arconai.tv/cye/"
alias regular="mpv https://www.arconai.tv/rs/"
alias rick="mpv https://www.arconai.tv/rm/"
alias south="mpv https://www.arconai.tv/sp/"
alias workers="mpv https://www.arconai.tv/workers/"
