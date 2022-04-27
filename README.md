# .dotfiles

The dotfiles are organized in a way to work with a [stow](https://www.gnu.org/software/stow/) utility that helps to manage symlinks.

### Usage

```sh
# 1. Clone and cd into repo
git clone git@github.com:vadymbarabanov/.dotfiles.git && cd .dotfiles

# 2. Create symlinks for all folders inside .dotfiles folder
# / is necessary to omit files (e.g. README.md)
stow */

# Optional: create a symlink for a particular config folder
stow nvim
```
