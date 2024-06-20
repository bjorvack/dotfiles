# If you come from bash you might have to change your $PATH.
eval "$(starship init zsh)"

## Aliases
alias dce='docker compose exec'
alias xdce='f() {container=$1; shift; dce \$container env XDEBUG_TRIGGER=\"yes\" PHP_IDE_CONFIG=\"serverName=xdebug\" $@}; f'
alias xcurl='curl -b \"XDEBUG_SESSION=1\"'
alias reset-test='sudo rm -rf var/cache/*; dce application ./bin/docker/setup_test_environment.sh'

alias vim='nvim'
