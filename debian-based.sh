#!/bin/bash

function _print {
    echo -e "\n||== \t$1\t ==||\n"
}

SUDO=''
command -v sudo >/dev/null 2>&1
if [[ $? -eq 0 ]]
then
	SUDO='sudo'
fi

_print "Initializing with \`apt install\`"

$SUDO apt-get install -y git \
	less \
	wget \
	curl \
	vim \
	zsh \
	nmap \
	tree \
	htop \
	python3 \
	python3-pip \
	jq \
	tmux \
	unzip \
	xclip

_print "All set."
_print "You may want to run \`apt upgrade\`"
