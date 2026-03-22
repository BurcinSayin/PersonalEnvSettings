#
# Example export:
# export EDITOR=vim

# export GITHUB_TOKEN=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

# Add Flutter SDK to PATH if it exists
if [ -d "$HOME/Android/flutter/bin" ] && [ "$(ls -A "$HOME/Android/flutter/bin")" ]; then
  export PATH="$HOME/Android/flutter/bin:$PATH"
fi


# Add Android SDK platfor tools to PATH if it exists
if [ -d "$HOME/Android/Sdk/platform-tools" ] && [ "$(ls -A "$HOME/Android/Sdk/platform-tools")" ]; then
  export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
  export ANDROID_HOME="$HOME/Android/Sdk"
fi

## Add git prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi