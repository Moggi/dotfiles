#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap thoughtbot/formulae
brew install rcm
rcup bash_profile
rcup vimrc
rcup zshrc

brew install git
brew install zsh
brew install vim
brew install curl
brew install wget
brew install nmap		#please
brew install docker
brew install docker-machine
brew install tmux

brew install dos2unix
brew install jq
brew install htop
brew install figlet		#yeah
brew install tree

brew install python3
brew install node
brew install go
brew install mono
brew install sqlite

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
