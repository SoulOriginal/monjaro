#!/usr/bin/env zsh

# Основные клавиатурные сокращения
bindkey '^p' history-search-backward  # Ctrl+P - поиск назад по истории
bindkey '^n' history-search-forward   # Ctrl+N - поиск вперед по истории
bindkey '^[w' kill-region            # Alt+W - вырезать регион

# Дополнительные сокращения для навигации
bindkey '^[[1;5C' forward-word       # Ctrl+Right - слово вперед
bindkey '^[[1;5D' backward-word      # Ctrl+Left - слово назад
bindkey '^[[H' beginning-of-line     # Home - начало строки
bindkey '^[[F' end-of-line          # End - конец строки 