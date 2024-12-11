{pkgs, ...}: let
  # FIXME: update the plugins
  tmux-nvim =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux.nvim";
      version = "unstable-2023-01-06";
      src = pkgs.fetchFromGitHub {
        owner = "aserowy";
        repo = "tmux.nvim/";
        rev = "57220071739c723c3a318e9d529d3e5045f503b8";
        sha256 = "sha256-zpg7XJky7PRa5sC7sPRsU2ZOjj0wcepITLAelPjEkSI=";
      };
    };
in {
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    historyLimit = 100000;
    terminal = "screen-256color";
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    # prefix = "C-a";
    plugins = with pkgs; [
      tmux-nvim
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-thumbs
      tmuxPlugins.yank
      tmuxPlugins.sessionist
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_date_time "%H:%M"
        '';
      }
    ];
    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"
      set-option -g status-position top
      # set-option -sg escape-time 10
      set-option -g repeat-time 1000

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Shift Alt vim keys to switch windows
      bind -n S-left previous-window
      bind -n S-right next-window

      # Easier reload of config
      bind R source-file ~/.config/tmux/tmux.conf

      # Change splits to match nvim and easier to remember
      # Open new split at cwd of current split
      unbind %
      unbind '"'
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # v in copy mode starts making selection
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel


      # make Prefix p paste the buffer.
      unbind p
      bind p paste-buffer

      # Enable resize mode with prefix + r
      bind r switch-client -T resize

      # Resize mode bindings
      # Use h,j,k,l for fine adjustments (1 cell)
      bind -T resize h resize-pane -L
      bind -T resize j resize-pane -D
      bind -T resize k resize-pane -U
      bind -T resize l resize-pane -R

      # Use H,J,K,L for larger adjustments (5 cells)
      bind -T resize H resize-pane -L 5
      bind -T resize J resize-pane -D 5
      bind -T resize K resize-pane -U 5
      bind -T resize L resize-pane -R 5

      # Use arrow keys for fine adjustments
      bind -T resize Left resize-pane -L
      bind -T resize Down resize-pane -D
      bind -T resize Up resize-pane -U
      bind -T resize Right resize-pane -R

      # Use Ctrl + arrow keys for larger adjustments
      bind -T resize C-Left resize-pane -L 5
      bind -T resize C-Down resize-pane -D 5
      bind -T resize C-Up resize-pane -U 5
      bind -T resize C-Right resize-pane -R 5

      # Press escape or enter to exit resize mode
      bind -T resize Escape switch-client -T root
      bind -T resize Enter switch-client -T root

      # Show visual indicator when in resize mode
      set-hook -g after-bind "if -F '#{==:#{client-key-table},resize}' 'set -g status-style bg=red' 'set -g status-style bg=default'"
      set-hook -g pane-mode-changed "if -F '#{==:#{client-key-table},resize}' 'set -g status-style bg=red' 'set -g status-style bg=default'"

    '';
  };
}
