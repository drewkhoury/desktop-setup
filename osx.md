## Install Homebrew

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

You can now manage many software packages through homebrew.

## Install other software using Homebrew

You can copy and paste the entire snippet below, or hand pick a few at a time to run.

```
# browsers
brew install --cask google-chrome
brew install --cask firefox
brew install --cask brave-browser

# communication and collaboration
brew install --cask slack
brew install --cask zoom
brew install google-drive
brew install --cask adobe-acrobat-reader
brew install --cask visual-studio-code
brew install sublime-text
brew install git

# mac - essentials
brew install --cask menumeters
brew install --cask rectangle
brew install --cask daisydisk

# developer essentials
brew install wget
brew install tree
brew install bash-completion
brew install --cask iterm2
brew install htop

# development
brew install --cask postman
sudo softwareupdate --install-rosetta && brew install aws-vpn-client
brew install awscli
```

Note: For newer Macs that use `Apple Silicon` (M1/M2), Rosetta 2 enables a Mac with Apple silicon to use apps built for a Mac with an Intel processor https://support.apple.com/en-us/HT211861 - this is needed for software such as `aws-vpn-client`.

## Other tools
These tools are less common. Unless you know you'll need them, you can skip this section:

```
# communication - some clients may require these
# brew install --cask microsoft-teams
# brew install --cask webex-meetings

# dev - virtualization
# brew install --cask virtualbox
# brew install --cask vagrant
```

**Note:** You can still install any other software that you need if you prefer working with software like node and python directly on your workstation.

A lot of software development can be facilitied with docker containers, and take advantage of a common pattern to build, test and deploy software - see https://3musketeers.io/

This reduces the need to manage software like ruby, python, node, maven, ansible etc. locally (which can be inconsistent across different developer machines). It also makes it easier to share and setup projects between developers with minimum setup instructions required.
