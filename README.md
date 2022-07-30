Tips for configuring a new Mac.

# Homebrew - Package Manager

Use homebrew to install software for your desktop.

Install Homebrew:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

then:

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Install Sofware Packages:

```
# desktop utilities # note: https://rectangleapp.com/ is the community replacement for spectacle
brew install --cask menumeters
#brew install --cask spectacle
brew install --cask rectangle

# browsers
brew install --cask google-chrome
brew install --cask firefox
brew install --cask brave-browser

# communication
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask zoom
brew install --cask webex-meetings

# essentials
brew install wget
brew install git
brew install --cask iterm2
brew install htop

# dev
brew install --cask docker
brew install --cask virtualbox
brew install --cask vagrant

# code
brew install --cask atom
brew install --cask visual-studio-code

# extras
brew install --cask adobe-acrobat-reader
brew install --cask nordvpn
brew install --cask drawio
brew install --cask daisydisk
brew install --cask twitch
brew install thefuck
brew install --cask postman

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

# XCODE

Install via App Store, or...

```
xcode-select --install
xcode-select -p
```
