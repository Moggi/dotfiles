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

    if [[ ! -d $HOME/.dotfiles ]]; then
        git clone https://github.com/Moggi/dotfiles.git $HOME/.dotfiles
    fi

    cd $HOME/.dotfiles/linkable

    for file in *; do
        if [[ ! -h $HOME/.$file ]]; then
            mv $HOME/.$file $HOME/.$file.bkp
            ln -s $PWD/$file $HOME/.$file
        fi
    done

    cd $HOME/.dotfiles
}

function _install_autojump {
    _check_cmd autojump

    if [[ $? -eq 0 ]]; then
        return 1
    fi

    mkdir -p $HOME/code/autojump/

    git clone https://github.com/wting/autojump.git  $HOME/code/autojump

    cd $HOME/code/autojump/

    if [[ $? -ne 0 ]]; then
        return 2
    fi

    python3 $PWD/install.py

    if [[ $? -ne 0 ]]; then
        return 3
    fi
    # @TODO: edit $HOME/.autojump/bin/autojump shebang to use python3   
}

function _install_vim-plug {
    _print "Checking vim-plug"
    if [[ -r $HOME/.vim/autoload/plug.vim ]]; then
        return 1
    fi

    curl -fsSLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    if [[ $? -ne 0 ]]; then
        return 2
    fi

    _check_cmd vim

    vim -esc "PlugUpdate!" -c "qa"
    if [[ $? -ne 0 ]]; then # @TODO: Does it return something usable?
        return 3
    fi
}

function _install_ohmyzsh {
    _print "Checking oh-my-zsh"
    if [[ -d $HOME/.oh-my-zsh/ ]]; then
        return 1
    fi

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    if [[ $? -ne 0 ]]; then
        return 2
    fi
}


SUDO=""

_check_cmd sudo
if [[ $? -eq 0 ]]
then
    SUDO='sudo'
fi

case "$(uname -s)" in
    Linux)
		_print "Starting Linux setup"

        _print "apt-get update"
        $SUDO apt-get -qq update

        _print "bash -c $PWD/debian-based.sh"
        $PWD/debian-based.sh

		;;
	Darwin)
		_print "Starting Darwin setup"

        _check_cmd brew
        if [[ $? -ne 0 ]]; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
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


_install_autojump
case $? in
    1)
        _print "autojump is already installed"
        ;;
    2)
        _print "Could not clone autojump repository to \$HOME/code"
        ;;
    3)
        _print "Could not install autojump"
        ;;
esac


cd $HOME


_print "Ending now..."
_print "You may want to change your terminal emulator settings to use \`zsh -i\` on start"
