#!/usr/bin/env zsh

# Настройки истории
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# Опции истории
setopt appendhistory     # Добавлять историю в файл, а не перезаписывать
setopt sharehistory     # Делить историю между всеми сессиями
setopt hist_ignore_space # Игнорировать команды, начинающиеся с пробела
setopt hist_ignore_all_dups # Игнорировать дубликаты
setopt hist_save_no_dups # Не сохранять дубликаты
setopt hist_ignore_dups  # Не показывать дубликаты в поиске
setopt hist_find_no_dups # Не показывать дубликаты в поиске 