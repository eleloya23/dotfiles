# Ele's dotfiles

My defaults. Gets a new OS X installation hacker ready.


Pre-Requisites
--------------

- **Mac OS X >10.10**
- **[Command Line Tools for
XCode](https://developer.apple.com/downloads/index.action).**


Installation
-----------

Type the following into the terminal:

```shell
git clone https://github.com/eleloya/osx_dotfiles.git
cd osx_dotfiles
./bootstrap.sh
```


Configuration
-----------


The following files are modifiables/configurable.

    ├── apps
    │   ├── cli
    │   └── gui
    ├── dotfiles
    └   └── *


### **apps/cli**

The Command Line Utilities this script is gonna install.

```
git
vim
wget
...
```

### **apps/gui**

The Graphical Applications this script is gonna install.

```
virtualbox
firefox
chrome
...
```

### **osxconfig**

Commands to pimp OS X. Every command has a description of what it does. If you want to install this script, please read this file beforehand.

```bash
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
...
```

### /dotfiles/*

Everything in here gets copied to `~`. You can, of course, replace the contents here with your own dotfiles.




Credits
--------

* [laptop](https://github.com/thoughtbot/laptop/) by Thoughtbot
* [OSXDefauts](https://github.com/kevinSuttle/OSXDefaults/) by Kevin Suttle
* [brightbit_new_machine.sh](https://gist.github.com/ericboehs/8712892) by Eric Boehs
