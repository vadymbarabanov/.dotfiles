# Creating symbol links

zsh
```
ln -s ~/.dotfiles/zsh/zshrc ~/.config/zsh/zshrc
sudo chmod +x ~/.config/zsh/zshrc
```

bspwm & bspswallow
```
ln -s ~/.dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
sudo chmod +x ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/terminals ~/.config/bspwm/terminals
ln -s ~/.dotfiles/bspwm/noswallow ~/.config/bspwm/noswallow
ln -s ~/.dotfiles/bspwm/swallow ~/.config/bspwm/swallow
```

sxhkd
```
ln -s ~/.dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
sudo chmod +x ~/.config/sxhkd/sxhkdrc
```

polybar
```
ln -s ~/.dotfiles/polybar/config ~/.config/polybar/config
```

nvim & coc
```
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
```

alacritty
```
ln -s ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
```
