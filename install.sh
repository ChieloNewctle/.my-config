#!/bin/bash

CONFIGS=(
  "atuin"
  "nvim"
  "zsh"
  "starship"
)

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

timestamp="$(date +%s)"

for name in "${CONFIGS[@]}"; do
  symlink="$HOME/.config/$name"
  target="$SCRIPT_DIR/$name"
  if [[ -L "$symlink" ]] && [[ "$(readlink "$symlink")" == "$target" ]]; then
    echo "the configuration of $name has been installed"
  else
    if [[ -e "$symlink" ]]; then
      mv "$symlink" "$HOME/.config/$name.$timestamp.bak"
    fi
    ln -s -T "$target" "$symlink"
    echo "the configuration of $name is installed"
  fi
done
