### Homebrew

Homebrew is the most common package manager for macOS. We recommend Homebrew to manage all software on your machine when available.

Follow the instructions at <https://brew.sh/> to install Homebrew on your Mac. It should look something like this:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

When you're done you'll be prompted to add brew to your shell with something like this:

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Install Software via brew commands in your terminal

If you're only looking to install the bare minimum tools that XXX you to have, you can run the following:

```
# desktop apps
brew install --cask zoom
brew install --cask slack
brew install google-drive

# Rosetta 2 enables a Mac with Apple silicon to use apps built for a Mac with an Intel processor - https://support.apple.com/en-us/HT211861
sudo softwareupdate --install-rosetta && brew install aws-vpn-client
```

You'll likely have other software you want to install. We've come up with a list of useful software packages we think you might need. You can copy and paste the entire snippet below, or hand pick the software you want as needed.

```
# browsers
brew install --cask google-chrome
brew install --cask firefox
brew install --cask brave-browser

# communication
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask zoom
brew install --cask webex-meetings

# extras
brew install --cask menumeters
brew install --cask rectangle
brew install --cask adobe-acrobat-reader
brew install --cask daisydisk
brew install google-drive
brew install aws-vpn-client

# dev - essentials
brew install --cask visual-studio-code
brew install sublime-text
brew install wget
brew install git
brew install tree
brew install bash-completion
brew install --cask iterm2
brew install htop
brew install awscli
brew install --cask postman

# dev - containerization
brew install --cask docker
brew install kubectl

# dev - virtualization (less likely you'll need this so commented out by default)
# brew install --cask virtualbox
# brew install --cask vagrant
```

Optional: If you'd like to move away from docker desktop, and use colima instead, you can run the following:

```
# if you had docker-desktop installed, briefly uninstall it and reinstsall to ensure you get the docker CLI only (may be able to skip this if you don't already have docker desktop)
# or, if you get a message about docker not being installed properly, do this ...
brew uninstall docker
brew install docker 

# additionals to replace docker desktop
brew install docker-buildx docker-compose docker-credential-helper
brew install colima 
```

Then you should just be able to run `colima start` and your `docker` commands should work like they usually do. You can also run `colima kubernetes start` for k8s.

## Other developer software

We haven't included instructions to install other developer software packages as you may not need to install them locally - you can install any other software that you need.

A lot of software development can be facilitied with docker containers, and take advnatage of a common pattern to build, test and deploy software - ie https://3musketeers.io/

This reduces the need to manage software like ruby, python, node, maven, ansible etc. locally (which can be inconsistent across different developer machines). It also makes it easier to share and setup projects between developers with minimum setup instructions required.
