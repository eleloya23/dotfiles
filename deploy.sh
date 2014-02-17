#!/usr/bin/env bash

echo "---> Password administrador"
sudo -v

echo "---> Generando ssh keys (se copiara al clipboard)"
[ ! -f ~/.ssh/id_rsa ] && ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa > /dev/null && pbcopy < ~/.ssh/id_rsa.pub
 
echo "--> Abriendo github para que agregar la ssh pub key"
open https://github.com/settings/ssh

echo "--> Instalando los dot files"
chmod +x ./dotfiles/install.sh
./dotfiles/install.sh

echo "---> Borrando los PDF de ~/Downloads"
rm -r ~/Downloads/About\ Downloads.lpdf 2>/dev/null


sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText “BlueHats”

echo "---> Activando Firewall"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1 2>/dev/null
 
echo "---> Screenlock con 1 minuto"
defaults -currentHost write com.apple.screensaver askForPassword -int 1 2>/dev/null
defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 60 2>/dev/null
 
echo "---> Trackpad: Activa tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true 2>/dev/null
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 2>/dev/null
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 2>/dev/null
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3 2>/dev/null

echo "---> Trackpad: Rapido como su $%#$% madre"
defaults write -g com.apple.trackpad.scaling -int 5 2>/dev/null
 
echo "---> Iluminar teclado en condiciones de baja luz"
defaults write com.apple.BezelServices kDim -bool true 2>/dev/null
 
echo "---> Desactivar iluminación despues de 5 minutos de idle time"
defaults write com.apple.BezelServices kDimTime -int 300 2>/dev/null
 
echo "---> Desactivar warning cuando se borrar la papelera"
defaults write com.apple.finder WarnOnEmptyTrash -bool false 2>/dev/null
 
echo "---> Desactivar warning cuando cambias la extension de un archivo"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false 2>/dev/null

echo "--> Desactivar que Quicktime y Preview abran siempre lo ultimo que viste"
 defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
 defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false
 
echo "--> Desactivar icono de TimeMachine y Volumen"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
   defaults write "${domain}" dontAutoLoad -array \
      "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
      "/System/Library/CoreServices/Menu Extras/Volume.menu" 
done


# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true



# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

defaults write com.apple.terminal "Default Window Settings" -string "Pro"
defaults write com.apple.terminal "Startup Window Settings" -string "Pro"

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Add a spacer to the left side of the Dock (where the applications are)
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'


# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

#icnos de tamaño 54 por default
defaults write com.apple.dock tilesize -int 54


# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Show the ~/Library folder
chflags nohidden ~/Library
# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
General -bool true \
OpenWith -bool true \
Privileges -bool true

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true



# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true


# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true


# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true



# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true



# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true


# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false


# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

 
echo "---> Setup Safari"
# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank" 2>/dev/null
 
# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2 2>/dev/null
 
# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true 2>/dev/null
 
# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false 2>/dev/null
 
# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()" 2>/dev/null
 
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true 2>/dev/null
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true 2>/dev/null
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true 2>/dev/null
 
# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true 2>/dev/null

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
"Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" \
"Terminal" ; do
killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
 
echo "---> Instalando homebrew"
if ! which brew &>/dev/null; then
    ruby <(curl -fsS https://raw.github.com/Homebrew/homebrew/go/install)
    brew update

  if ! grep -qs "recommended by brew doctor" ~/.bash_profile; then
    echo "Put Homebrew location earlier in PATH ..."
      echo "\n# recommended by brew doctor" >> ~/.bash_profile
      echo "export PATH=\"/usr/local/bin:\$PATH\"\n" >> ~/.bash_profile
      export PATH="/usr/local/bin:$PATH"
  fi
else
  echo "Homebrew already installed. Skipping ..."
fi
  
echo "---> Instalando command line utilities"
 
brew install ctags 2>/dev/null # For indexing files (vim tab completion of methods, classes, variables)
brew install curl-ca-bundle 2>/dev/null # Makes ruby 2 + openssl happy (along with export SSL_CERT_FILE=/usr...)
brew install findutils 2>/dev/null # GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install git 2>/dev/null # Distributed version control
brew install git-extras 2>/dev/null # Helpful git commands; See https://github.com/visionmedia/git-extras
brew install heroku-toolbelt 2>/dev/null # Recommened way to install heroku command line
brew install htop-osx 2>/dev/null # Better top
brew install imagemagick 2>/dev/null # Process images (used for carrierwave gem)
brew install vim  2>/dev/null # Newer, better, faster, stronger vim
brew install macvim  2>/dev/null # Newer, better, faster, stronger vim
brew install memcached 2>/dev/null # Good open source memory store for caching
brew install nmap 2>/dev/null # nmap
brew install node 2>/dev/null # JS V8 engine
brew install qt 2>/dev/null
brew install phantomjs 2>/dev/null # Headless webkit used for testing (with capybara/poltergeist)
brew install postgresql --no-python 2>/dev/null # Realational Database
brew install reattach-to-user-namespace 2>/dev/null # Reattaches user namespace in tmux (for pasteboard interaction and ruby motion)
brew install redis 2>/dev/null # Key-value store
brew install rename 2>/dev/null # Like mv but better (takes regex)
brew install tmux 2>/dev/null # Terminal multiplexer (for saving project state and switching between projects)
brew install tree 2>/dev/null # ASCII view of directory/file structure
brew install watch 2>/dev/null # Repeateadly run a command (clearing output between runs)
brew install wget --enable-iri 2>/dev/null # wget with IRI support

echo "---> Instalando native apps"
brew tap phinze/homebrew-cask 2>/dev/null
brew install brew-cask 2>/dev/null
 
function installcask() {
brew cask install "${@}" 2> /dev/null
}

echo "---> Instalando Alfred"
installcask alfred

echo "---> Instalando Cyberduck"
installcask copy

echo "---> Instalando Copy"
installcask copy

echo "---> Instalando Evernote"
installcask evernote

echo "---> Instalando Firefox"
installcask firefox 

echo "---> Instalando Flux"
installcask flux

echo "---> Instalando Google Chrome"
installcask google-chrome

echo "---> Instalando Handbrake"
installcask handbrake

echo "---> Instalando Harvest Time Tracking"
installcask harvest

echo "---> Instalando Jitsi"
installcask jitsi

echo "---> Instalando Kindle Reader"
installcask kindle 

echo "---> Instalando Kismac"
installcask kismac 

echo "---> Instalando Littlesnitch"
installcask littlesnitch 

echo "---> Instalando Textmate"
installcask texmate

echo "---> Instalando Transmission"
installcask transmission

echo "---> Instalando Transmit"
installcask transmit

echo "---> Instalando Google Chrome"
installcask google-chrome

echo "---> Instalando Omnifocus"
installcask omnifocus

echo "---> Instalando Spotify"
installcask spotify

echo "---> Instalando Vlc"
installcask vlc

echo "---> Instalando Wireshark"
installcask wireshark

echo "---> Set up postgres"
initdb /usr/local/var/postgres -E utf8 >/dev/null 2>&1
 
echo "---> Start service automatically"
mkdir -p ~/Library/LaunchAgents
ln -sf /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
ln -sf /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
ln -sf /usr/local/opt/redis/*.plist ~/Library/LaunchAgents


echo "---> Setup github user"
GITHUB_USER_SET=$(git config -f ~/.gitconfig.private github.user)
[[ -z $GITHUB_USER_SET && -z $GITHUB_USER ]] && echo 'Escribe tu github username:' && read GITHUB_USER
[[ $GITHUB_USER_SET != $GITHUB_USER ]] && git config -f ~/.gitconfig.private github.user $GITHUB_USER > /dev/null
[[ -z $GITHUB_USER ]] && GITHUB_USER=$GITHUB_USER_SET
 
GIT_EMAIL_SET=$(git config -f ~/.gitconfig.private user.email)
[[ -z $GIT_EMAIL_SET && -z $GIT_EMAIL ]] && echo 'Escribe tu correo de github:' && read GIT_EMAIL
[[ $GIT_EMAIL_SET != $GIT_EMAIL ]] && git config -f ~/.gitconfig.private user.email $GIT_EMAIL > /dev/null

 
GIT_NAME_SET=$(git config -f ~/.gitconfig.private user.name)
[[ -z $GIT_NAME_SET && -z $GIT_NAME ]] && echo 'Escribe tu nombre para git:' && read GIT_NAME
[[ $GIT_NAME_SET != $GIT_NAME ]] && git config -f ~/.gitconfig.private user.name $GIT_NAME > /dev/null


curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enable
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
source ~/.bash_profile

rvm install 2.1.0
rvm install 1.9.3

echo "---> Listo!"

#  Ideas de cosas que deberia instalar
#  
#  build tools (Linux only)
#  RVM + Ruby 1.9.2 (with bundler and capistrano)
#  Homebrew (OSX only)
#  git
#  ack
#  curl
#  wget
#  ctags
#  (G)vim (Linux), MacVim (OSX)
#  MySQL client, server, dev libs and headers
#  libxml2
#  Firefox
#  Google Chrome
#  Skype
