
apt-get update
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | apt-key add -
echo "deb http://apt.thoughtbot.com/debian/ stable main" | tee /etc/apt/sources.list.d/thoughtbot.list
apt-get update
apt-get install -y rcm
rcup bash_profile
rcup vimrc
rcup zshrc

apt-get install -y git\
	wget\
	curl\
	vim\
	zsh\
	nmap\
	less\
	man\
	htop\
	python3\
	node

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
