Deployster
======
Deployster es un script que tranforma tu nueva Mac OS X en una verdadera maquina para programar.

Requirements
------------

### Mac OS X

Tienes que tener instalado GCC en la computadora:

Para Lion (10.7) o Mountain Lion (10.8): Usa [Command Line Tools for
XCode](https://developer.apple.com/downloads/index.action).

Para Mavericks (10.9): Escribe `sudo xcodebuild -license`, instala y acepta los terminos. Despues  escribe `xcode-select --install` en tu terminal y finalmente click en "Install".

Instalación
-------

### Mac OS X

Escribe lo siguiente en tu terminal:

    git clone git@github.com:Bluehats/deployster.git
    cd deployster
    ./deploy.sh


Lo que instala
---------------

Command line tools:

* Ctags
* Git
* Homebrew
* Vim
* MVim
* ImageMagick
* Heroku Toolbelt
* Memcached
* Node
* Qt
* PhantomJS
* PostgresSQL
* Redis
* Rename
* Tree
* Watch
* Wget

Mac Apps:

* alfred
* copy
* cyberduck
* evernote
* firefox
* flux
* google-chrome
* handbrake
* harvest
* jitsi
* littlesnitch
* textmate
* transmission
* transmit
* google-chrome
* omnifocus
* spotify
* vlc
* wireshark


Credits
-------

Deployster esta hecho por BlueHats/joseloya pero esta basado en varios scripts.

[laptop](https://github.com/thoughtbot/laptop/) by Thoughtbot
[OSXDefauts](https://github.com/kevinSuttle/OSXDefaults/) by Kevin Suttle
[brightbit_new_machine.sh](https://gist.github.com/ericboehs/8712892) by Eric Boehs

