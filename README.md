# Maik's .files

Dot files for my Arch Linux + bspwm + kitty + neovim.

![](.config/yadm/screen.jpg)

## Setup

Dotfiles are managed with [yadm](https://yadm.io/), that needs to be installed first.
You can then setup your system by cloning this repository with `yadm clone`.

### Install yadm 
NOTE: *do not* do it with apt! It is usually an outdated version, get it from the official github instead with the following command:
```sh
sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && sudo chmod a+x /usr/local/bin/yadm
```

### Clone this repo as your dotfiles
```sh
yadm clone https://github.com/Maik93/dotfiles
```
If prompted, do not execute bootstrap scripts just after cloning, since there is some configuration to be done first.

### Configure your scenario

Choose the right classes, mixing together OS and scenario.
If nothing is supplied, everything is written for Archlinux with BSWM.

Set OS among:
- `arch`
- `ubuntu`
- `debian`

Optionally, set a scenario:
- `tui`: non-graphical target;
- `wsl`: non-graphical, inside WSL2.

```bash
yadm config local.class <os-type> # like 'arch' or 'ubuntu'
yadm config --add local.class <secondary-stuff> # like 'tui' or 'wsl'

yadm alt # refresh links based on the selected classes

yadm bootstrap # install needed dependencies, based on the configuration just set
```

The bootstrapping script should setup and install most things, and get you a completely usable system.
There are, however, still some further configuration needed for some of the applications that I use. The following sub-sections will cover these extra setups.

### Neovim setup

Open `nvim` and run `:PackerCompile` (during the first run ONLY), then `PackerInstall`.
For any plugin that you'll later update, run `PackerUpdate`.

## List of packages

### Primary

- `rofi`: Application launcher
- `zsh`: Shell
- `kitty`: Terminal emulator
- `bspwm`: Window manager (rounded corners fork, see below)
- `sxhkd`: Hotkey daemon
- `dunst`: Notification daemon
- `neovim`: Editor
- `nvim-packer`: Vim Plugin Manager
- `polybar`: Status bar
- `evince`: PDF reader
- `betterlockscreen`: Lock screen
- `libinput`: Touch pad driver
- `ranger`: File explorer

### Secondary

- `maim`: Screenclip to clipboard
- `w3m`: Used to display images in ranger
- `picom`: Compositor
- `pulseaudio / -alsa`: Audio driver
- `pamixer`: Pulseaudio manager
- `NetworkManager`: 'Networking that just works'
- `btop`: Beautiful TUI activity monitor
- `xcwd`: Used to open a new terminal in the same directory as the current focused terminal
- Fonts:
  - JetBrains Mono (`ttf-jetbrains-mono`)
  - noto-fonts
  - ttf-font-awesome
  - icomoon-feather
