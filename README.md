
# dotfiles

Personal dotfiles

## How to

1. Clone [this repo][1] at ~/.dotfiles
2. Run ```debian-based.sh``` or ```darwin-based.sh```
3. For [oh-my-zsh][2]: ```chsh -s /bin/zsh```
4. Open **vim** and install [vim-plug][3]: ```PlugUpdate!```
5. Then install [autojump][4]
6. And maybe [goTo][4]

[1]: https://github.com/Moggi/dotfiles.git
[2]: https://github.com/ohmyzsh/ohmyzsh#basic-installation
[3]: https://github.com/junegunn/vim-plug#installation
[4]: https://github.com/wting/autojump
[5]: https://github.com/Moggi/goTo

## One-liner (WIP)

```sh
# Of course it needs *curl* beforehand
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Moggi/dotfiles/master/install.sh)"
```
