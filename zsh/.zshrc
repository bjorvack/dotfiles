# If you come from bash you might have to change your $PATH.

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

## Aliases
alias dce='docker compose exec'
alias xdce='f() {container=$1; shift; dce \$container env XDEBUG_TRIGGER=\"yes\" PHP_IDE_CONFIG=\"serverName=xdebug\" $@}; f'
alias xcurl='curl -b \"XDEBUG_SESSION=1\"'
alias reset-test='sudo rm -rf var/cache/*; dce application ./bin/docker/setup_test_environment.sh'

# Source files
source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

neofetch