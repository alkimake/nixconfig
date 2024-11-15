_: {
  programs.zsh.initExtra = ''
    # Homebrew initialization
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Additional zsh configurations can go here
    export PATH="/opt/homebrew/bin:$PATH"


    # Lima Docker context setup
    if command -v limactl >/dev/null 2>&1; then
      # Start Lima if it's not running
      if ! limactl list | grep -q "docker.*Running"; then
        limactl start docker
      fi

      # Set up Docker context for Lima
      if ! docker context ls | grep -q "lima-docker"; then
        docker context create lima-docker --docker "host=unix://$${HOME}/.lima/docker/sock/docker.sock"
      fi
    fi
  '';
}
