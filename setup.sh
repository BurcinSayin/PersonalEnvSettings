#!/bin/bash
#
# setup.sh: Installs the shell configuration into ~/.bashrc.

# This script's directory, for a robust path
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ALIASES_FILE="$SCRIPT_DIR/config/aliases.sh"
EXPORTS_FILE="$SCRIPT_DIR/config/exports.sh"
BASHRC_FILE=~/.bashrc

SOURCE_ALIAS_LINE="source \"$ALIASES_FILE\""
SOURCE_EXPORT_LINE="source \"$EXPORTS_FILE\""

# Install bash-git-prompt if not already present
if [ ! -d ~/.bash-git-prompt ]; then
    echo "Cloning bash-git-prompt..."
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
    echo "Done."
else
    echo "bash-git-prompt already installed, pulling latest changes..."
    (cd ~/.bash-git-prompt && git pull)
    echo "Done."
fi

# Add sourcing of aliases to ~/.bashrc if not already present
if ! grep -Fxq "$SOURCE_ALIAS_LINE" "$BASHRC_FILE"; then
    echo "Adding aliases to $BASHRC_FILE"
    printf "\n# Source shell-config aliases\n%s\n" "$SOURCE_ALIAS_LINE" >> "$BASHRC_FILE"
    echo "Done. Please run 'source $BASHRC_FILE' or open a new terminal."
else
    echo "Aliases already configured in $BASHRC_FILE."
fi

# Add sourcing of exports to ~/.bashrc if not already present
if ! grep -Fxq "$SOURCE_EXPORT_LINE" "$BASHRC_FILE"; then
    echo "Adding exports to $BASHRC_FILE"
    printf "\n# Source shell-config exports\n%s\n" "$SOURCE_EXPORT_LINE" >> "$BASHRC_FILE"
    echo "Done. Please run 'source $BASHRC_FILE' or open a new terminal."
else
    echo "Exports already configured in $BASHRC_FILE."
fi
