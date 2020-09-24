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

# a real browser
brew cask install google-chrome

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

# code
brew cask install atom
brew cask install visual-studio-code
```

## iTerm

If you're using iTerm consider adding the following color themes. Download the iTerm presets for the theme by running:

```
cd ~/Downloads
curl -o "Atom One Dark.itermcolors" https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors
curl -o "Atom One Light.itermcolors" https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Light.itermcolors
```

Then, in iTerm2 Preferences, under **Profiles and Colors**, go to **Color Presets... > Import...**, find and open the **Atom One Dark.itermcolors** file.


# Mac config (manual)

- Turn on: Vault & Firewall


# Misc

This is an older repo but has useful tips: https://github.com/nicolashery/mac-dev-setup

homebrew cheatsheet:

```
brew list --cask
brew outdated --cask
brew upgrade --cask
```


