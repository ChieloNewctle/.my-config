#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

(cd "$SCRIPT_DIR" && git submodule update --init --recursive || exit)

TIMESTAMP="$(date +%s)"

CONFIGS=(
  "atuin"
  "direnv"
  "fontconfig/conf.d"
  "nvim"
  "rustfmt"
  "starship"
  "tmux"
  "zsh"
)

backup_and_link_to() {
  symlink="$1"
  target="$2"
  mkdir -p "$(dirname "$symlink")"
  if [[ -L "$symlink" ]] && [[ "$(readlink "$symlink")" == "$target" ]]; then
    echo "$symlink has been installed"
  else
    if [[ -e "$symlink" ]]; then
      mv "$symlink" "$symlink.$TIMESTAMP.bak"
    fi
    ln -s -T "$target" "$symlink"
    echo "$symlink is installed"
  fi
}

for name in "${CONFIGS[@]}"; do
  backup_and_link_to "$HOME/.config/$name" "$SCRIPT_DIR/$name"
done

for item in zsh/zshenv zsh/zshrc zsh/zprofile fbterm/fbtermrc; do
  backup_and_link_to "$HOME/.$(basename $item)" "$SCRIPT_DIR/$item"
done
