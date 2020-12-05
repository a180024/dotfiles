# Dotfiles Configuration

## SetUp
Install the following:
- Hammerspoon and Karabiner Elements for key mappings
- Zsh and ohmyzsh
- Tmux
- Vim
- Z 
- FZF
- fd

Then, copy the config files.
```
$ mkdir .dotfiles
$ cd .dotfiles
$ git clone https://github.com/a180024/dotfiles
$ find ~+ -type f -name ".*" ln -sv {} ~ \;
```

