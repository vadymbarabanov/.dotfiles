# .dotfiles

This is a collection of configuration files (dotfiles) designed to work with the `stow` tool, which helps link them to your system.

## How to Use

### 1. Clone .dotfiles

First, clone the files to your computer and go into the folder:

```sh
git clone https://github.com/vadymbarabanov/.dotfiles.git && cd .dotfiles
```

### 2. Link the configs

**Option 1: Link all configs at once**  

Use this command to create links for all the configs in the `.dotfiles` folder. The `/` at the end skips files like `README.md`:

```sh
stow */
```

**Option 2: Link one config at a time**  

If you only want to link a specific config folder (for example, `nvim`), run:

```sh
stow nvim
```

