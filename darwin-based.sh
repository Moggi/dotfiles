#!/bin/bash

function _print {
    echo -e "\n||== \t$1\t ==||\n"
}

_print "Initializing with \`brew install\`"

brew install git
brew install zsh
brew install vim
brew install curl
brew install wget
brew install nmap
brew install docker
brew install docker-machine
brew install tmux

brew install jq
brew install htop
brew install tree
brew install unzip

brew install python3

_print "All set."
