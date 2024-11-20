_: {
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  programs = {
    git = {
      enable = true;
      userName = "Alkim Ake Gozen";
      userEmail = "alkimake@pm.me";
      # TODO: add default gpg key and configure with `config.me`
      signing = {
        signByDefault = true;
        key = "649D70BEBA8C8C0C";
      };
      lfs = {
        enable = true;
        skipSmudge = true;
      };
      delta = {
        # TODO: Cattpuccin theme
        enable = true;
      };
      extraConfig = {
        pull.rebase = true;
        push = {autoSetupRemote = true;};
        color = {
          ui = "auto";
        };
        init.defaultBranch = "main";
        core = {
          editor = "nvim";
        };
      };
      aliases = {
        lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
        permission-reset = "!git diff -p -R --no-color | grep -E \"^(diff|(old|new) mode)\" --color=never | git apply";
        lg = "log --graph --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)<%an> %C(reset)' --date=relative";
        lgd = "log --graph --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)(%ad) <%an> %C(reset)' --date=relative";
        lga = "log --graph --all --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)<%an> %C(reset)' --date=relative";
        lgad = "log --graph --all --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)(%ad) <%an> %C(reset)' --date=relative";
        ci = "commit";
      };
      ignores = [
        ".direnv"
        ".vscode/"
        ".idea/"
        "venv/"
        "env/"
        ".venv/"
        ".editorconfig"
        "*.ake"
        "__pycache__/"
        "*.iml"
        "*.ipr"
        "*.iws"
        "*.drawio.bkp"
        ".DS_Store"
        "*.kubeconfig"
      ];
    };
    lazygit.enable = true;
  };
}
