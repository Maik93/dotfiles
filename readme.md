# Maik's dotfiles
Dotfiles for my terminal-only distros.

## Packages

- `zsh`: Shell
- `ranger`: File explorer
- `neovim`: Editor
- `nvim-packer`: Vim Plugin Manager
- `btop`: Beautiful TUI activity monitor

## Installation

Installation and the dotfiles are to be managed with [yadm](https://yadm.io/), thus installation is done through cloning the repository using `yadm clone`, and then confirm running the bootstrapping script when prompted to. If not prompted after cloning, executing the bootstrapping script can be done at any time with `yadm bootstrap`.

Thus, if you have a completely fresh install of arch, do the following:

```sh
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
yadm clone https://github.com/Maik93/dotfiles -b tui
# then DO NOT run bootstrap
```

Choose the right classes, among:
- arch
- ubuntu
- ros

```sh
yadm config --add local.class <a_class_u_want> # can be run multiple times
yadm alt # refresh links based on the selected classes
```

Now, you can execute the bootstrap with `yadm bootstrap`.
The script should setup and install most things, and get you a completely usable system. There are, however, still some further configuration needed for some of the applications that I use. The following sub-sections will cover these extra setups.

### Neovim setup

Simply open `nvim` and run `:PackerCompile` (during the first run ONLY), then `PackerInstall`.
For any plugin that you'll later update, run `PackerUpdate`.
