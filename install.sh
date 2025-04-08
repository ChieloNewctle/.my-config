#!/bin/bash
TIMESTAMP="$(date +%s)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
for NAME in "atuin" "nvim" "zsh"; do
  CONFIG="$HOME/.config/$NAME"
  TARGET="$SCRIPT_DIR/$NAME"
  if [[ -L "$CONFIG" ]] && [[ "$(readlink "$CONFIG")" == "$TARGET" ]]; then
    echo "the configuration of $NAME has been installed"
  else
    if [[ -e "$CONFIG" ]]; then
      mv "$CONFIG" "$HOME/.config/$NAME.$TIMESTAMP.bak"
    fi
    ln -s -T "$TARGET" "$CONFIG"
    echo "the configuration of $NAME is installed"
  fi
done
