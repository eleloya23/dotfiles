Deployster
======
Deployster es un script que tranforma tu nueva Mac OS X en una verdadera maquina para programar.

Pre-Requisitos
--------------

### Mac OS X

Tienes que tener instalado GCC en la computadora:

**Lion (10.7) o Mountain Lion (10.8)**: Usa [Command Line Tools for
XCode](https://developer.apple.com/downloads/index.action).

**Mavericks (10.9)**: Ejecuta `sudo xcodebuild -license` y sigue las instrucciones. Despues  escribe `xcode-select --install` en tu terminal y finalmente click en "Install".

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

