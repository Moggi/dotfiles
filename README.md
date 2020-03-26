
# dotfiles

Personal dotfiles

## How to

1. Clone this repo at ~/.dotfiles
2. Run ```debian-based.sh``` or ```darwin-based.sh```
3. For [oh-my-zsh][1]: ```chsh -s /bin/zsh```
4. Open **vim** and install [vim-plug][2]: ```PlugUpdate!```
5. Don't forget this: [goTo][3]

[1]: https://github.com/ohmyzsh/ohmyzsh#basic-installation
[2]: https://github.com/junegunn/vim-plug#installation
[3]: https://github.com/Moggi/goTo

## One-liner

```sh
# Of course it needs *curl* beforehand
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Moggi/dotfiles/master/install.sh)"
```
