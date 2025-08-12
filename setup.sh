#!/bin/bash
#
# setup.sh: Installs the shell configuration into ~/.bashrc.

# This script's directory, for a robust path
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ALIASES_FILE="$SCRIPT_DIR/config/aliases.sh"
EXPORTS_FILE="$SCRIPT_DIR/config/exports.sh"
BASHRC_FILE=~/.bashrc
BASH_PROFILE_FILE=~/.bash_profile

SOURCE_ALIAS_LINE="source \"$ALIASES_FILE\""
SOURCE_EXPORT_LINE="source \"$EXPORTS_FILE\""

# Add sourcing of aliases to ~/.bashrc if not already present
if ! grep -Fxq "$SOURCE_ALIAS_LINE" "$BASHRC_FILE"; then
    echo "Adding aliases to $BASHRC_FILE"
    printf "\n# Source shell-config aliases\n%s\n" "$SOURCE_ALIAS_LINE" >> "$BASHRC_FILE"
    echo "Done. Please run 'source $BASHRC_FILE' or open a new terminal."
else
    echo "Aliases already configured in $BASHRC_FILE."
fi

# Add sourcing of exports to ~/.bash_profile if not already present
if ! grep -Fxq "$SOURCE_EXPORT_LINE" "$BASH_PROFILE_FILE"; then
    echo "Adding exports to $BASH_PROFILE_FILE"
    printf "\n# Source shell-config exports\n%s\n" "$SOURCE_EXPORT_LINE" >> "$BASH_PROFILE_FILE"
    echo "Done. Please open a new terminal to see the changes."
else
    echo "Exports already configured in $BASH_PROFILE_FILE."
fi
