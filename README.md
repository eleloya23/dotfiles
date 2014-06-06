# SuperBotas

Script que transforma tu Mac en una verdadera maquina para programar.


Pre-Requisitos
--------------

- **Mac OS X (10.9 o menor)**
- **[Command Line Tools for
XCode](https://developer.apple.com/downloads/index.action).**


Configuración
-----------


**SuperBotas** trata de ser lo mas modular posible. Los siguientes archivos son modificables.

    ├── config
    │   ├── apps
    │   ├── tools
    │   ├── rubies
    │   └── osxconfig
    ├── dotfiles
    │   ├── bash_profile
    │   ├── vimrc
    │   ├── vim/*


### **config/tools**

Este archivo tiene la lista de command line tools que se van a instalar en tu compu. Ejemplo:

```
git
vim
wget
...
```

### **config/apps**

Este archivo tiene la lista de Desktop Apps que se van a instalar en tu compu. Ejemplo:

```
virtualbox
firefox
chrome
...
```

### **config/rubies**

Este archivo contiene la lista de versiones de **ruby** a instalar por `rvm`

```
2.1.0
2.0.0
1.9.3
1.8.7
rbx-2.1.1
rbx-2.0.0
```

### **config/osxconfig**

Puros comandos para tunnear y optimizar tu maquina. Todos tienen comentarios si quieres saber lo que hacen!.

```bash
echo "Desactivar warning cuando se borrar la papelera"
defaults write com.apple.finder WarnOnEmptyTrash -bool false 2>/dev/null

echo "Desactivar warning cuando cambias la extension de un archivo"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false 2>/dev/null
...
```

### /dotfiles/*

Archivos de configuración para bash y vim que creemos nos hacen mas productivos. Puedes modificarlos o agregar los tuyos. SuperBotas se encarga de copiarlos todos a la carpeta del usuario `~`



Instalación
-----------

Escribe lo siguiente en la terminal:

```shell
git clone https://github.com/joseloya/SuperBotas.git
cd SuperBotas
./botas.sh
```



Creditos
--------

SuperBotas esta hecho por @joseloya pero esta basado en varios scripts.

* [laptop](https://github.com/thoughtbot/laptop/) by Thoughtbot
* [OSXDefauts](https://github.com/kevinSuttle/OSXDefaults/) by Kevin Suttle
* [brightbit_new_machine.sh](https://gist.github.com/ericboehs/8712892) by Eric Boehs
