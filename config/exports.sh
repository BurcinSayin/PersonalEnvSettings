#
# Example export:
# export EDITOR=vim

# Add Flutter SDK to PATH if it exists
if [ -d "/media/orin/TuxData/work/SDK/flutter/bin" ] && [ "$(ls -A "/media/orin/TuxData/work/SDK/flutter/bin")" ]; then
  export PATH="/media/orin/TuxData/work/SDK/flutter/bin:$PATH"
fi
