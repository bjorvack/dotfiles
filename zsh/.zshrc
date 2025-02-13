# If you come from bash you might have to change your $PATH.
eval "$(starship init zsh)"
eval "$(brew shellenv)"

# Fix search history
bindkey '^R' history-incremental-search-backward

alias ssh-hcl001='ssh root@com-hclpapi001.srv.combell-ops.net'
alias ssh-migration-be04='ssh bvanacker@tb-be04-hclmigrationapi001.srv.teamblue-ops.net'

# Aliases
## Docker
alias dce='docker compose exec'
alias xdce='f() { container=$1; shift; dce "$container" env XDEBUG_TRIGGER="yes" PHP_IDE_CONFIG="serverName=xdebug" "$@"; }; f'
alias xcurl='curl -b \"XDEBUG_SESSION=1\"'
alias reset-test='sudo rm -rf var/cache/*; dce application ./bin/docker/setup_test_environment.sh'

alias update-spec='curl -s "http://0.0.0.0:8001/api/docs?complex=TeamBlue" | jq . --indent 4 > ./resources/api/api-spec.json'
alias update-js-spec='curl -s "http://0.0.0.0:8001/api/docs.json" | jq . --indent 2 > ./build/docs.json'

## Farnsworth
#alias farnsworth='docker run --mount type=bind,src=$HOME/.config/farnsworth/.env.local,dst=/opt/farnsworth/.env.local --mount type=bind,src=$HOME/.config/farnsworth/dev.decrypt.private.php,dst=/opt/farnsworth/config/secrets/dev/dev.decrypt.private.php,ro=true -ti git.combell-ops.net:4567/platforms/farnsworth:latest'

## Vim
alias vim='nvim'
export EDITOR=nvim
export XDEBUG_MODE=coverage 

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
alias ls="ls -la"

export PATH=$PATH:/Users/bjornvanacker/.config/bin
export PATH=$PATH:/Users/bjornvanacker/.spicetify
export PATH=$PATH:/Users/bjornvanacker/.scripts
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$PATH:/Users/bjornvanacker/.gem/ruby/3.3.0/bin/"
