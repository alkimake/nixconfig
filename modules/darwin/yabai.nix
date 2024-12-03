{pkgs, ...}: let
  yabai-pkg = pkgs.yabai;
  yabai-bin = "${yabai-pkg}/bin/yabai";
in {
  services = {
    yabai = {
      enable = false;
      package = pkgs.yabai;
      enableScriptingAddition = true;
      config = {
        layout = "bsp";
        focus_follows_mouse = "off";
        mouse_follows_focus = "off";
        window_placement = "second_child";
        window_opacity = "off";
        top_padding = 5;
        bottom_padding = 5;
        left_padding = 5;
        right_padding = 5;
        window_gap = 10;
      };
      extraConfig = ''
        yabai -m rule --add app="^System Settings$" manage=off
        yabai -m rule --add app="^Calculator$" manage=off
        yabai -m rule --add app="^Karabiner-Elements$" manage=off
        yabai -m rule --add app="^QuickTime Player$" manage=off

        yabai -m rule --add app="^kitty$" border=off
        yabai -m rule --add app="^kitty$" title="${pkgs.kitty}/bin/kitty"
      '';
    };
    skhd = {
      enable = false;
      skhdConfig = ''
        # Switch spaces
        alt - 1 : ${yabai-bin} -m space --focus 1
        alt - 2 : ${yabai-bin} -m space --focus 2
        alt - 3 : ${yabai-bin} -m space --focus 3
        alt - 4 : ${yabai-bin} -m space --focus 4
        alt - 5 : ${yabai-bin} -m space --focus 5
        alt - 6 : ${yabai-bin} -m space --focus 6
        alt - 7 : ${yabai-bin} -m space --focus 7

        # Move windows to spaces
        shift + alt - 1 : ${yabai-bin} -m window --space 1
        shift + alt - 2 : ${yabai-bin} -m window --space 2
        shift + alt - 3 : ${yabai-bin} -m window --space 3
        shift + alt - 4 : ${yabai-bin} -m window --space 4
        shift + alt - 5 : ${yabai-bin} -m window --space 5
        shift + alt - 6 : ${yabai-bin} -m window --space 6
        shift + alt - 7 : ${yabai-bin} -m window --space 7

        # Focus windows
        alt - h : ${yabai-bin} -m window --focus west
        alt - j : ${yabai-bin} -m window --focus south
        alt - k : ${yabai-bin} -m window --focus north
        alt - l : ${yabai-bin} -m window --focus east

        # Move windows
        shift + alt - h : ${yabai-bin} -m window --swap west
        shift + alt - j : ${yabai-bin} -m window --swap south
        shift + alt - k : ${yabai-bin} -m window --swap north
        shift + alt - l : ${yabai-bin} -m window --swap east

        shift + alt - w : ${yabai-bin} -m window --display west; ${yabai-bin} -m display --focus west
        shift + alt - e : ${yabai-bin} -m window --display east; ${yabai-bin} -m display --focus east

        # Resize windows
        ctrl + alt - h : ${yabai-bin} -m window --resize left:-50:0; \
                         ${yabai-bin} -m window --resize right:-50:0
        ctrl + alt - j : ${yabai-bin} -m window --resize bottom:0:50; \
                         ${yabai-bin} -m window --resize top:0:50
        ctrl + alt - k : ${yabai-bin} -m window --resize top:0:-50; \
                         ${yabai-bin} -m window --resize bottom:0:-50
        ctrl + alt - l : ${yabai-bin} -m window --resize right:50:0; \
                         ${yabai-bin} -m window --resize left:50:0

        # Toggle window properties
        alt - f : ${yabai-bin} -m window --toggle zoom-fullscreen
        shift + alt - f : ${yabai-bin} -m window --toggle native-fullscreen
        alt - t : ${yabai-bin} -m window --toggle float

        # Launch kitty terminal (using nix-installed kitty)
        # cmd - return : ${pkgs.kitty}/bin/kitty --single-instance --directory="$HOME"

        # Restart yabai
        ctrl + alt + cmd - r : launchctl kickstart -k "org.nixos.yabai"
      '';
    };
  };
}
