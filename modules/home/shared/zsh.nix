{
  pkgs,
  config,
  ...
}: let
  # FIXME: only nixos
  # pimg = pkgs.writeShellScriptBin "pimg" ''
  #   output="out.png"
  #   [ ! -z "$1" ] && output="$1.png"
  #   # xclip -se c -t image/png -o > "$output"
  #   ${pkgs.wl-clipboard}/bin/wl-paste > "$output"
  # '';
in {
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
        l = "${pkgs.eza}/bin/eza -lbF --git --group-directories-first --icons";
        ll = "${pkgs.eza}/bin/eza -lbGF --git --group-directories-first --icons";
        llm = "${pkgs.eza}/bin/eza -lbGd --git --sort=modified --group-directories-first --icons";
        la = "${pkgs.eza}/bin/eza -lbhHigmuSa --time-style=long-iso --git --color-scale --group-directories-first --icons";
        lx = "${pkgs.eza}/bin/eza -lbhHigmuSa@ --time-style=long-iso --git --color-scale --group-directories-first --icons";
        lt = "${pkgs.eza}/bin/eza --tree --level=2 --group-directories-first --icons";
        tree = "${pkgs.eza}/bin/eza --color=auto --tree";
        cal = "cal -m";
        grep = "grep --color=auto";
        q = "exit";
        ":q" = "exit";
        weather = "${pkgs.curl}/bin/curl -4 http://wttr.in/Seoul";
        # nix-shell = "nix-shell --command ${pkgs.zsh}/bin/zsh";
      };
      initExtra = ''
        # EXTRACT FUNCTION (needs more nix)

        # PROMPT
        autoload -U colors && colors
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${config.colorScheme.palette.base03}"
        bindkey '^ ' autosuggest-accept


        proj() {
          dir="$(cat ~/.local/share/direnv/allow/* | uniq | xargs dirname | ${pkgs.fzf}/bin/fzf --height 9)"
          cd "$dir"
        }
        bindkey -s '\eOP' 'proj\n'

        plf() {
          proj
          yazi
        }

      '';
      # FIXME: make darwin compatible
      envExtra = ''
        export EDITOR="nvim"
        # export TERMINAL="kitty"
        # export TERM="kitty"
        # export BROWSER="firefox"
        # export VIDEO="mpv"
        # export IMAGE="imv"
        # export OPENER="xdg-open"
        # export SCRIPTS="$HOME/scripts"
        # export LAUNCHER="rofi -dmenu"
        export FZF_DEFAULT_OPTS="--color=16"

        # Less colors
        export LESS_TERMCAP_mb=$'\e[1;32m'
        export LESS_TERMCAP_md=$'\e[1;32m'
        export LESS_TERMCAP_me=$'\e[0m'
        export LESS_TERMCAP_se=$'\e[0m'
        export LESS_TERMCAP_so=$'\e[01;33m'
        export LESS_TERMCAP_ue=$'\e[0m'
        export LESS_TERMCAP_us=$'\e[1;4;31m'
        export vimcolorscheme="catppuccin-mocha"
      '';
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
        "--inline-info"
        "--color 'fg:#${config.colorScheme.palette.base05}'" # Text
        "--color 'bg:#${config.colorScheme.palette.base00}'" # Background
        "--color 'preview-fg:#${config.colorScheme.palette.base05}'" # Preview window text
        "--color 'preview-bg:#${config.colorScheme.palette.base02}'" # Preview window background
        "--color 'hl:#${config.colorScheme.palette.base0A}'" # Highlighted substrings
        "--color 'fg+:#${config.colorScheme.palette.base0D}'" # Text (current line)
        "--color 'bg+:#${config.colorScheme.palette.base02}'" # Background (current line)
        "--color 'gutter:#${config.colorScheme.palette.base02}'" # Gutter on the left (defaults to bg+)
        "--color 'hl+:#${config.colorScheme.palette.base0E}'" # Highlighted substrings (current line)
        "--color 'info:#${config.colorScheme.palette.base0E}'" # Info line (match counters)
        "--color 'border:#${config.colorScheme.palette.base0D}'" # Border around the window (--border and --preview)
        "--color 'prompt:#${config.colorScheme.palette.base05}'" # Prompt
        "--color 'pointer:#${config.colorScheme.palette.base0E}'" # Pointer to the current line
        "--color 'marker:#${config.colorScheme.palette.base0E}'" # Multi-select marker
        "--color 'spinner:#${config.colorScheme.palette.base0E}'" # Streaming input indicator
        "--color 'header:#${config.colorScheme.palette.base05}'" # Header
      ];
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    dircolors = {
      enable = true;
      # FIXME: for darwin it will be iterm may be ?
      # extraConfig = ''
      #   TERM kitty
      # '';
      enableZshIntegration = true;
    };
  };

  home.packages = [
    # FIXME: only nixos have pimg
    # pimg
  ];
}
