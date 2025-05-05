#!/bin/bash

# The shebang (`#!/bin/bash`) specifies that this script should be run with the Bash shell.

# Declare an associative array to map source files to their corresponding destination directories.
# Associative arrays allow us to use "key-value" pairs, where the key is the source file path,
# and the value is the destination directory. 
# The `-A` flag is essential to tell Bash we want to use an associative array (not an indexed one).

declare -A CONFIG_MAP=(
  # Each line is a mapping of the source config file path to its destination directory.
  # Files
  ["$HOME/.config/nano/nanorc"]="$HOME/repos/my-configs/nano"
  ["$HOME/.config/ranger/rc.conf"]="$HOME/repos/my-configs/ranger"
  ["$HOME/.config/ghostty/config"]="$HOME/repos/my-configs/ghostty"
  ["$HOME/.bash_aliases"]="$HOME/repos/my-configs/bash-aliases"
  # Directories
  ["$HOME/.config/nvim/"]="$HOME/repos/my-configs/nvim/"
  ["$HOME/.my-bash-scripts/"]="$HOME/repos/my-configs/my-bash-scripts/"
)
echo "Copying config files to matching repos..."
# "${!CONFIG_MAP[@]}" returns all keys (file paths) in the array.
for SRC in "${!CONFIG_MAP[@]}"; do
  DEST_DIR="${CONFIG_MAP[$SRC]}"
  BASENAME=$(basename "$SRC")
  DEST_FILE="$DEST_DIR/$BASENAME"

  if [[ -f "$SRC" ]]; then
    mkdir -p "$DEST_DIR"
    cp "$SRC" "$DEST_FILE"
    echo "✓ Copied $BASENAME to $DEST_DIR"
  elif [[ -d "$SRC" ]]; then
    mkdir -p "$DEST_DIR"
    cp -r "$SRC"/* "$DEST_DIR"  # Copy only the contents of the directory
    echo "✓ Copied contents of $BASENAME to $DEST_DIR"
  else
    echo "File not found: $SRC"
  fi
done

echo "All done."

