Tips for configuring a new Mac.

# Homebrew - Package Manager

Use homebrew to install software for your desktop.

Install Homebrew:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

Install Sofware Packages:

```
# desktop utilities
brew cask install menumeters
brew cask install spectacle

# browsers
brew cask install google-chrome
brew install firefox
brew install --cask brave-browser

# communication
brew cask install slack
brew cask install microsoft-teams
brew cask install zoomus
brew cask install webex-meetings

# essentials
brew install wget
brew install git
brew cask install iterm2

# dev
brew cask install docker
brew cask install virtualbox
brew cask install vagrant

# code
brew cask install atom
brew cask install visual-studio-code

# extras
brew cask install adobe-acrobat-reader
brew cask install nordvpn
brew install --cask drawio
brew install --cask daisydisk
brew install --cask twitch

# https://apps.apple.com/us/app/notability/id736189492?mt=12
```

## iTerm

If you're using iTerm consider adding the following color themes. Download the iTerm presets for the theme by running:

```
cd ~/Downloads
curl -o "Atom One Dark.itermcolors" https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors
curl -o "Atom One Light.itermcolors" https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Light.itermcolors
```

Then, in iTerm2 Preferences, under **Profiles and Colors**, go to **Color Presets... > Import...**, find and open the **Atom One Dark.itermcolors** file.

## zsh config (default shell on newer Macs)

Create a `~/.zshrc` file:

```
HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE

alias history="history 1"
```

# Mac config (manual)

- Turn on: Vault & Firewall

# Git

```
ssh-keygen
git config --global --edit
```

# Misc

This is an older repo but has useful tips: https://github.com/nicolashery/mac-dev-setup

homebrew cheatsheet:

```
# info
brew list --cask
brew outdated --cask
brew info <package_name>

# update system
brew update
brew upgrade
brew upgrade --cask
brew upgrade --cask --greedy

# greedy == update casks that do not have versioning information (version :latest) 
#           or applications that have a built-in upgrade mechanism (auto_updates true
```


# Reclaim some disk space!


```
sudo tmutil deletelocalsnapshots /
sudo rm -rf /.DocumentRevisions-V100
brew cleanup
docker system prune -a

# check for additional folders/mounts in `/Volumes` that shouldn't be there, such as `Shared Support` etc https://pc.net/helpcenter/answers/recover_mac_free_disk_space

```
