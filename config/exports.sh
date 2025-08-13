#
# Example export:
# export EDITOR=vim

# Add Flutter SDK to PATH if it exists
if [ -d "$HOME/Android/flutter/bin" ] && [ "$(ls -A "$HOME/Android/flutter/bin")" ]; then
  export PATH="$HOME/Android/flutter/bin:$PATH"
fi


# Add Android SDK platfor tools to PATH if it exists
if [ -d "$HOME/Android/Sdk/platform-tools" ] && [ "$(ls -A "$HOME/Android/Sdk/platform-tools")" ]; then
  export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi