#!/bin/bash

function _print {
    echo -e "\n||==\t$1\t==||\n"
}

function _check_cmd {
    _print "Checking $1 utility/program"
    command -v $1 >/dev/null 2>&1
    return $?
}

function _git_clone_and_link_dotfiles {
    _print "Checking dotfiles"
    git clone https://github.com/Moggi/dotfiles.git $HOME/.dotfiles

    cd $HOME/.dotfiles/linkable

    for file in *; do
        ln -s $PWD/$file $HOME/.$file
    done

    cd $HOME/.dotfiles
}

function _install_goTo {
    _check_cmd gt
    if [[ $? -gt 0 ]]; then
        return 1
    fi

    mkdir -p $HOME/Code # git clone already creates the path, but..

    git clone https://github.com/Moggi/goTo.git $HOME/Code/

    cd $HOME/Code/goTo

    if [[ $? -gt 0 ]]; then
        return 2
    fi

    $PWD/install.sh

    if [[ $? -gt 0 ]]; then
        return 3
    fi
}

function _install_vim-plug {
    _print "Checking vim-plug"
    if [[ -r $HOME/.vim/autoload/plug.vim ]]; then
        return 1
    fi

    curl -fsSLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    if [[ $? -gt 0 ]]; then
        return 2
    fi

    _check_cmd vim

    vim -es -u $HOME/.vimrc -i NONE -c "PlugUpdate\!" -c "qa"
    if [[ $? -gt 0 ]]; then # @TODO: Does it return something usable?
        return 3
    fi
}

function _install_ohmyzsh {
    _print "Checking oh-my-zsh"
    if [[ -d $HOME/.oh-my-zsh/ ]]; then
        return 1
    fi

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    if [[ $? -gt 0 ]]; then
        return 2
    fi
}

case "$(uname -s)" in
    Linux)
		_print "Starting Linux setup"

        sudo apt-get -qq update

        _check_cmd git
        if [[ $? -gt 0 ]]; then
            sudo apt-get -qq install git
        else
            _print "Git is already installed"
        fi

        $PWD/debian-based.sh

		;;
	Darwin)
		_print "Starting Darwin setup"

        _check_cmd brew
        if [[ $? -gt 0 ]]; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
        fi
        
        _check_cmd git
        if [[ $? -gt 0 ]]; then
            brew install git
        fi

        $PWD/darwin-based.sh

		;;
esac

# ohmyzsh
_install_ohmyzsh
case $? in
    1)
        _print "oh-my-zsh is already installed"
        ;;
    2)
        _print "Could not download oh-my-zsh"
        ;;
esac


_git_clone_and_link_dotfiles


# vim-plug
_install_vim-plug
case $? in
    1)
        _print "vim-plug is already installed"
        ;;
    2)
        _print "Could not download vim-plug"
        ;;
esac


# goTo
_install_goTo
case $? in
    1)
        _print "goTo is already installed"
        ;;
    2)
        _print "Could not clone goTo repository to \$HOME/Code"
        ;;
    3)
        _print "Could not install goTo"
        ;;
esac

cd $HOME


_print "Ending now..."
_print "You may need to change your terminal emulator settings to use \`zsh -i\` on start"
