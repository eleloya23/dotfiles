Deployster
======
Deployster es un script que tranforma tu nueva Mac OS X en una verdadera maquina para programar.

Aunque actualmente configura la computadora para desarrollar Ruby On Rails, deployster es bastante [customizable](#customizando) y se puede ajustar a tu equipo.

Pre-Requisitos
--------------

### Mac OS X

Tienes que tener instalado GCC en la computadora:

**Lion (10.7) o Mountain Lion (10.8)**: Descarga [Command Line Tools for
XCode](https://developer.apple.com/downloads/index.action).

**Mavericks (10.9)**: Ejecuta `sudo xcodebuild -license` y sigue las instrucciones. Finalmente ejecute `xcode-select --install`. *Algunos usuarios [reportan](http://stackoverflow.com/questions/19907576/xcode-is-not-currently-available-from-the-software-update-server) que fue necesario bajar Xcode desde la AppStore.*

Instalación
-----------

Escribe lo siguiente en la terminal:

```shell
git clone git@github.com:Bluehats/deployster.git
cd deployster
./deploy.sh
```


Herramientas Instaladas
-----------------------

*No se muestran todas, solo las mas importantes.*

Command Line Tools ( *./defaults/brew.tools* )

    git
    homebrew
    vim
    mvim
    heroku-toolbelt
    postgressql
    memcached
    redis
    wget
    nmap    
    node
    ruby (2.1.0, 2.0.0, 1.9.3)
    rvm


Mac Apps ( *./defaults/brew.apps* )

    alfred
    copy
    cyberduck
    evernote
    firefox
    flux
    google-chrome
    handbrake
    harvest
    jitsi
    littlesnitch
    textmate
    transmission
    transmit
    google-chrome
    omnifocus
    spotify
    vlc
    wireshark


Customizando
------------

Deployster trata de ser lo mas modular posible. Los siguientes archivos son modificables.

    ├── defaults
    │   ├── brew.apps
    │   ├── brew.tools 
    │   ├── brew.post 
    │   ├── osxconfig
    │   └── rubies 
    └── resources
        ├── wallpaper.jpg
        ├── dotfiles
        │   ├── bash_profile
        │   ├── aliases
        │   ├── bashconfig
        │   ├── functions
        │   ├── gitconfig
        │   ├── gitignore
        │   ├── gitmessage
        │   ├── gvimrc
        │   ├── vimrc
        │   ├── vim/*

Creditos
--------

Deployster esta hecho por @joseloya pero esta basado en varios scripts.

* [laptop](https://github.com/thoughtbot/laptop/) by Thoughtbot
* [OSXDefauts](https://github.com/kevinSuttle/OSXDefaults/) by Kevin Suttle
* [brightbit_new_machine.sh](https://gist.github.com/ericboehs/8712892) by Eric Boehs

