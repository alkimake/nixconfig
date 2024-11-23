_: {
  programs.zsh.initExtra = ''
    # Homebrew initialization
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Additional zsh configurations can go here
    export PATH="/opt/homebrew/bin:$PATH"


  '';
}
