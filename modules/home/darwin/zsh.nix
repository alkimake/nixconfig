_: {
  programs.zsh.initExtra = ''
    # Homebrew initialization
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Additional zsh configurations can go here
    export PATH="/opt/homebrew/bin:$PATH"

    if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
      export PATH=/opt/homebrew/opt/ruby/bin:$PATH
      export PATH=`gem environment gemdir`/bin:$PATH
    fi
    export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools
  '';
}
