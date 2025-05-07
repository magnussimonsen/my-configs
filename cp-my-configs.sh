#!/bin/bash

declare -A CONFIG_MAP=(
  ["$HOME/.config/nano/nanorc"]="$HOME/repos/my-configs/nano"
  ["$HOME/.config/ranger/rc.conf"]="$HOME/repos/my-configs/ranger"
  ["$HOME/.config/ghostty/config"]="$HOME/repos/my-configs/ghostty"
  ["$HOME/.bash_aliases"]="$HOME/repos/my-configs/bash-aliases"
  ["$HOME/.config/nvim/"]="$HOME/repos/my-configs/nvim/"
  ["$HOME/.my-bash-scripts/"]="$HOME/repos/my-configs/my-bash-scripts/"
)

echo "Copying config files to matching repos..."
printf "%-10s %-30s -> %s\n" "Status" "Item" "Destination"

for SRC in "${!CONFIG_MAP[@]}"; do
  DEST_DIR="${CONFIG_MAP[$SRC]}"
  BASENAME=$(basename "$SRC")
  DEST_FILE="$DEST_DIR/$BASENAME"

  if [[ -f "$SRC" ]]; then
    mkdir -p "$DEST_DIR"
    cp "$SRC" "$DEST_FILE"
    printf "✓ %-8s %-30s -> %s\n" "FILE" "$BASENAME" "$DEST_DIR"
  elif [[ -d "$SRC" ]]; then
    mkdir -p "$DEST_DIR"
    cp -r "$SRC"/* "$DEST_DIR"
    printf "✓ %-8s %-30s -> %s\n" "DIR" "$BASENAME" "$DEST_DIR"
  else
    printf "✗ %-8s %-30s -> %s\n" "MISSING" "$SRC" "Not Found"
  fi
done

echo "All done."
