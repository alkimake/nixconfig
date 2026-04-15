_: {
  programs = {
    # on macOS, you probably don't need this
    bash = {
      enable = true;
      bashrcExtra = ''
        # Custom bash profile goes here
      '';
    };
  };
}
