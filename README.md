
# About

Useful awesome wm config framework.

# Dependency

* awesome 4.0+
* rofi
* slock
* alsa-utils
* xclip
* goldendict
* pavucontrol

# Usage

1. Install dependencies
1. Setup dotfiles

        cd ~/.config
        git clone --recursive https://github.com/jaypei/hh-awesome.git awesome

1. Setup .Xresources (optional)

        cd ~/.config/awesome
        ln -s $(pwd)/etc/Xresources ~/.Xresources
        xrdb !$

1. Restart your awesome window manager

        echo "awesome.restart()" | awesome-client

# Screenshots

![wall.png] (https://raw.githubusercontent.com/wiki/jaypei/hh-awesome/screenshots/wall.png)
![terminals.png] (https://raw.githubusercontent.com/wiki/jaypei/hh-awesome/screenshots/terminals.png)
![drop.png] (https://raw.githubusercontent.com/wiki/jaypei/hh-awesome/screenshots/drop.png)

