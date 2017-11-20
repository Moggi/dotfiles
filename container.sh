
apt-get update
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | apt-key add -
echo "deb http://apt.thoughtbot.com/debian/ stable main" | tee /etc/apt/sources.list.d/thoughtbot.list
apt-get update
apt-get install -y rcm
echo "rcm for dotfiles: 'mkrc <files>' then 'rcup <files>'"

apt-get install -y git \
	wget \
	curl \
	vim \
	zsh \
	nmap \
	less \
	man \
	htop \
	python3 \
	node \
	unzip

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
