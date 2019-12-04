# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_PLUGINS=$ZSH/plugins;
export DOT_FILES=$HOME/.dotfiles ## The location of this .zshrc file

## Copy the theme file to the zsh/themes folder.
## Comment/change this part if you want to use another theme
if [ -f $ZSH/themes/geometry-modified.zsh-theme ]; then
    cp $DOT_FILES/geometry-modified.zsh-theme $ZSH/themes/
fi

## Install zsh-autosuggestions plugin.
if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

## Install zsh-autosuggestions plugin.
if [ ! -d $ZSH/custom/plugins/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting plugin"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

ZSH_THEME="geometry-modified"

source $ZSH/oh-my-zsh.sh

# JAVA

if [ ! -v JAVA_HOME ]; then
    vared -p "Please set JAVA instalation path to PATH variable: " -c tmp
    export JAVA_HOME=$tmp

    export PATH=$PATH:$JAVA_HOME/bin
    export PATH=$PATH:$JAVA_HOME/jre
    
    unset tmp
fi

# ANDROID
if [ ! -v ANDROID_HOME ]; then
    vared -p "Please set ANDROID_HOME variable: " -c andr
    export ANDROID_HOME=$andr

    export PATH=$ANDROID_HOME/platform-tools:$PATH
    export PATH=$ANDROID_HOME/tools:$PATH
    export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$PATH
    unset andr
fi

# NVM
if [[ uname -ne "Linux" ]]; then 
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
fi

plugins=(
  git
  docker
  docker-compose
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
echo -e "\nLoading custom functions..."
source $DOT_FILES/.functions.sh

alias reload='source $DOT_FILES/.zshrc'

echo -e "\nLoading custom aliases..."
source $DOT_FILES/.aliases.sh

# Add Visual Studio Code (code)
if [[ `uname` -ne "Linux" ]]; then
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi
