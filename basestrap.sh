#! /bin/sh

echo "<username> ALL=(ALL) NOPASSWD:ALL"
echo ""

while true; do
    read -p "Have you uncomment this line in /etc/sudoers [y/n] ?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y (yes) or n (no).";;
    esac
done

echo ""
echo "Packages downloading"

sudo pacman -S zsh bspwm sxhkd polybar neovim alacritty dunst xorg-xprop

echo ""
echo "Start creating symbol links from"

# Check if ~/.config folder exists
[!-d "~/.config" ] && echo "Creating ~/.config folder" && mkdir ~/.config

# zsh
    # make zsh default shell
chsh -s $(which zsh)
    # symbol links config
ln -s ~/.dotfiles/zsh/zprofile ~/.zprofile
[!-d "~/.config/zsh" ] && echo "Creating zsh folder" && mkdir ~/.config/zsh
ln -s ~/.dotfiles/zsh/zshrc ~/.config/zsh/.zshrc
sudo chmod +x ~/.config/zsh/.zshrc
ln -s ~/.dotfiles/zsh/zshenv ~/.config/zsh/.zshenv
sudo chmod +x ~/.config/zsh/.zshenv

# bspwm & bspswallow
[!-d "~/.config/bspwm" ] && echo "Creating bspwm folder" && mkdir ~/.config/bspwm
ln -s ~/.dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
sudo chmod +x ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/terminals ~/.config/bspwm/terminals
ln -s ~/.dotfiles/bspwm/noswallow ~/.config/bspwm/noswallow
ln -s ~/.dotfiles/bspwm/swallow ~/.config/bspwm/swallow

# sxhkd
[!-d "~/.config/sxhkd" ] && echo "Creating sxhkd folder" && mkdir ~/.config/sxhkd
ln -s ~/.dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
sudo chmod +x ~/.config/sxhkd/sxhkdrc

# polybar
[!-d "~/.config/polybar" ] && echo "Creating polybar folder" && mkdir ~/.config/polybar
ln -s ~/.dotfiles/polybar/config ~/.config/polybar/config

# nvim & coc
    # installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# alacritty
[!-d "~/.config/alacritty" ] && echo "Creating alacritty folder" && mkdir ~/.config/alacritty
ln -s ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# dunst
[!-d "~/.config/dunst" ] && echo "Creating dunst folder" && mkdir ~/.config/dunst
ln -s ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

echo "####"
echo "Done"
echo "####"
