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
    │   ├── rubies
    │   └── osxconfig 
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


### defaults/brew.apps

Contiene la lista de aplicaciones (***Ejemplo.app***) que deployster instala. Para ver una lista de aplicaciones disponibles [da click aqui](https://github.com/phinze/homebrew-cask/tree/master/Casks).


```
evernote
firefox 
google-chrome
littlesnitch 
texmate
transmission
vlc
...
```

### defaults/brew.tools

Contiene la lista de ***command line tools*** que `deployster` instala. Se instalan mediante brew.


```
vim
wget 
node
git
postgresql
...
```

### defaults/brew.post

Herramientas que necesitan *configuración extra*.


```Shell
cout "Postgres: Setup"
initdb /usr/local/var/postgres -E utf8 >/dev/null 2>&1
```

### defaults/rubies

Este archivo contiene la lista de versiones de **ruby** a instalar por `rvm`

```
2.1.0
2.0.0
1.9.3
1.8.7
rbx-2.1.1
rbx-2.0.0
```

### defaults/osxconfig

Este archivo contiene comandos que personalizan Mac OS X.

```Shell
echo "Desactivando efectos de sonido en el boot"
sudo nvram SystemAudioVolume=" " 2>/dev/null

echo "Desactivar warning cuando se borrar la papelera"
defaults write com.apple.finder WarnOnEmptyTrash -bool false 2>/dev/null
```

### resources/wallpaper.jpg

El wallpaper de nuestra organizacion. Por supuesto que lo puedes cambiar a tu gusto. Es importante recordar que el archivo **debe llamarse wallpaper.jpg**

### resources/dotfiles/*

Archivos de bash y vim que, en BlueHats, creemos nos hacen mas productivos. Puedes modificarlos o agregar los tuyos, deployer se encarga de copiarlos todos a la carpeta del usuario `~`



Creditos
--------

Deployster esta hecho por @joseloya pero esta basado en varios scripts.

* [laptop](https://github.com/thoughtbot/laptop/) by Thoughtbot
* [OSXDefauts](https://github.com/kevinSuttle/OSXDefaults/) by Kevin Suttle
* [brightbit_new_machine.sh](https://gist.github.com/ericboehs/8712892) by Eric Boehs

