# If you come from bash you might have to change your $PATH.
eval "$(starship init zsh)"

# Environment variables
export HTTPS_PROXY=$(symfony proxy:url)

# Aliases
## Docker
alias dce='docker compose exec'
alias xdce='f() {container=$1; shift; dce \$container env XDEBUG_TRIGGER=\"yes\" PHP_IDE_CONFIG=\"serverName=xdebug\" $@}; f'
alias xcurl='curl -b \"XDEBUG_SESSION=1\"'
alias reset-test='sudo rm -rf var/cache/*; dce application ./bin/docker/setup_test_environment.sh'

## Farnsworth
alias farnsworth='docker run --mount type=bind,src=$HOME/.config/farnsworth/.env.local,dst=/opt/farnsworth/.env.local --mount type=bind,src=$HOME/.config/farnsworth/dev.decrypt.private.php,dst=/opt/farnsworth/config/secrets/dev/dev.decrypt.private.php,ro=true -ti git.combell-ops.net:4567/platforms/farnsworth:latest'

## Vim
alias vim='nvim'

## Git
alias g='git'
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gll='git log --oneline'
alias glll='git log --oneline --graph'
alias gllll='git log --oneline --graph --all'
alias glllll='git log --oneline --graph --all --decorate'
alias gllllll='git log --oneline --graph --all --decorate --stat'
alias glllllll='git log --oneline --graph --all --decorate --stat --name-status'
alias gllllllll='git log --oneline --graph --all --decorate --stat --name-status --date=short'
alias glllllllll='git log --oneline --graph --all --decorate --stat --name-status --date=short --author-date-order'

alias copysha="git log -1 --format=%H | pbcopy"

export PATH=$PATH:/Users/bjornvanacker/.spicetify
export PATH=$PATH:/Users/bjornvanacker/.scripts
