#!/bin/bash
#
# setup.sh: Installs the shell configuration into ~/.bashrc.

# This script's directory, for a robust path
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ALIASES_FILE="$SCRIPT_DIR/config/aliases.sh"
BASHRC_FILE=~/.bashrc

SOURCE_LINE="source \"$ALIASES_FILE\""

# Add sourcing of aliases to ~/.bashrc if not already present
if ! grep -Fxq "$SOURCE_LINE" "$BASHRC_FILE"; then
    echo "Adding aliases to $BASHRC_FILE"
    printf "\n# Source shell-config aliases\n%s\n" "$SOURCE_LINE" >> "$BASHRC_FILE"
    echo "Done. Please run 'source $BASHRC_FILE' or open a new terminal."
else
    echo "Aliases already configured in $BASHRC_FILE."
fi
