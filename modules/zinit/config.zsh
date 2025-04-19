#!/usr/bin/env zsh

# Основные плагины
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Сниппеты из Oh My Zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::gitignore
zinit snippet OMZP::colored-man-pages

# Библиотеки Oh My Zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/clipboard.zsh

# Автодополнение
autoload -Uz compinit && compinit

# Настройки автодополнения
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Дополнительные плагины
zinit ice wait'1' lucid
zinit light mellbourn/zabb

zinit ice wait'1' lucid
zinit light junegunn/fzf

# Применяем изменения
zinit cdreplay -q 