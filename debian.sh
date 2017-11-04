
sudo apt-get update
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb http://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install -y rcm
rcup bash_profile
rcup vimrc
rcup zshrc

sudo apt-get install -y git\
	wget\
	curl\
	vim\
	zsh\
	nmap\
	less\
	dos2unix\
	man\
	tree\
	htop\
	figlet\
	python3\
	node\
	sqlite\
	jq\
	docker\
	tmux

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
