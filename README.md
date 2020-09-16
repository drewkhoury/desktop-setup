

When setting up a new Mac, here's the steps I follow:


```

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


# install apps
############################################

# utilities
brew cask install menumeters
brew cask install spectacle

# a real browser
brew cask install google-chrome

# communication
brew cask install slack
brew cask install microsoft-teams
brew cask install zoomus

# essential dev
brew install wget
brew install git
brew cask install iterm2
brew cask install docker
brew cask install virtualbox
brew cask install atom
brew cask install visual-studio-code

# theme for iterm
cd ~/Downloads
curl -o "Atom One Dark.itermcolors" https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors
curl -o "Atom One Light.itermcolors" https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Light.itermcolors
```

This is an older repo but has useful tips: https://github.com/nicolashery/mac-dev-setup

homebrew cheatsheet:

```
brew list --cask
brew outdated --cask
brew upgrade --cask
```
