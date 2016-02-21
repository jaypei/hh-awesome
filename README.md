
# About

Useful awesome wm config framework.

# Dependency

* awesome 3.5+
* rofi
* deepin-screenshot
* slock
* alsa-utils
* xclip


# Usage

1. Install dependencies
1. Setup dotfiles

        cd ~/.config
        git clone --recursive https://github.com/jaypei/hh-awesome.git awesome

1. Setup .Xresources (optional)

        ln -s $(pwd)/etc/Xresources ~/.Xresources
        xrdb !$

1. Restart your awesome window manager

        echo "awesome.restart()" | awesome-client

# Screenshots

![wall.png] (https://raw.githubusercontent.com/wiki/jaypei/hh-awesome/screenshots/wall.png)
![terminals.png] (https://raw.githubusercontent.com/wiki/jaypei/hh-awesome/screenshots/terminals.png)
![drop.png] (https://raw.githubusercontent.com/wiki/jaypei/hh-awesome/screenshots/drop.png)

