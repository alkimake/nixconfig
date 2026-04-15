{config, ...}: let
  # Get the current hostname and use it to determine git settings
  hostname = config.networking.hostName or "unknown";
  hostConfig = config.hosts.${hostname} or null;
  
  # Default values if no host-specific config is found
  defaultEmail = "alkimake@pm.me";
  defaultSigningKey = "649D70BEBA8C8C0C";
  
  # Use host-specific values or defaults
  userEmail = if hostConfig != null then hostConfig.git.email else defaultEmail;
  signingKey = if hostConfig != null then hostConfig.git.signingKey else defaultSigningKey;
in {
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  programs = {
    git = {
      enable = true;
      signing = {
        signByDefault = true;
        key = signingKey;
      };
      lfs = {
        enable = true;
        skipSmudge = true;
      };
      settings = {
        user = {
          name = "Alkim Ake Gozen";
          email = userEmail;
        };
        pull.rebase = true;
        push = {autoSetupRemote = true;};
        color = {
          ui = "auto";
        };
        init.defaultBranch = "main";
        core = {
          editor = "nvim";
        };
        alias = {
          lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
          permission-reset = "!git diff -p -R --no-color | grep -E \"^(diff|(old|new) mode)\" --color=never | git apply";
          lg = "log --graph --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)<%an> %C(reset)' --date=relative";
          lgd = "log --graph --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)(%ad) <%an> %C(reset)' --date=relative";
          lga = "log --graph --all --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)<%an> %C(reset)' --date=relative";
          lgad = "log --graph --all --pretty=format:'%C(auto)%h%d%C(reset) %s %C(green)(%cd) %C(blue)(%ad) <%an> %C(reset)' --date=relative";
          ci = "commit";
        };
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
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
    lazygit = {
      enable = true;
      settings = {
        git = {
          paging = {
            colorArg = "always";
            pager = "delta --paging=never";
          };
        };
      };
    };
  };
}
