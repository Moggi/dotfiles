#!/bin/bash

function _print {
    echo -e "\n||== \t$1\t ==||\n"
}

_print "Initializing with \`apt install\`"

sudo apt-get install -y git \
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
	unzip

_print "All set."
_print "You may want to run \`sudo apt upgrade\`"
