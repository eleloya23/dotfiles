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


I tried to be as modular as possible. The following files are modifiables.

    ├── apps
    │   ├── cli
    │   └── gui
    ├── dotfiles
    └   └── *


### **apps/cli**

This file contains all the command line utilities this script is gonna install.

```
git
vim
wget
...
```

### **apps/gui**

This file contains all the graphical applications this script is gonna install.

```
virtualbox
firefox
chrome
...
```

### **osxconfig**

Command to pimp my mac. Every command has a description of what it does. If you want to install this script, I recommend you to read this file thoroughly.

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




Thanks to
--------

* [laptop](https://github.com/thoughtbot/laptop/) by Thoughtbot
* [OSXDefauts](https://github.com/kevinSuttle/OSXDefaults/) by Kevin Suttle
* [brightbit_new_machine.sh](https://gist.github.com/ericboehs/8712892) by Eric Boehs
