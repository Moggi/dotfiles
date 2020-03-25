#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
