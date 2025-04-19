#!/usr/bin/env zsh

# Базовые алиасы
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias zxc='exec zsh'

# Git алиасы
alias gc="git co"
alias gp="git pull"
alias gcr='f() { gc ${1:-$(git branch -r | grep -oP "release/\d+\.\d+\.\d+" | sort -V | tail -n 1)}; }; f ; gp'

# Безопасные команды для работы с файлами (закомментированы по умолчанию)
# alias 'command rm'='command rm --interactive=once --preserve-root --verbose'
# alias 'cp'='cp --interactive --verbose'
# alias 'ln'='ln --interactive --verbose'
# alias 'mv'='mv --interactive --verbose'
# alias 'rm'='echo Use either \`trash\` or \`command rm\` instead.; false'
# alias 'trash'='trash --interactive --verbose' 