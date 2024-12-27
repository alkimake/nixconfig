{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    aerospace
  ];
  services.aerospace = {
    enable = true;
    settings = {
      gaps = {
        outer = {
          left = 0;
          bottom = 0;
          top = [{monitor."built-in" = 14;} 44];
          right = 0;
        };
        inner = {
          horizontal = 3;
          vertical = 3;
        };
      };
      "key-mapping".preset = "qwerty";
      automatically-unhide-macos-hidden-apps = false;
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "sketchybar --trigger aerospace_workspace_change AEROSPACE_FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE AEROSPACE_PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
      ];
      mode.main.binding = {
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-s = "layout v_accordion"; # "layout stacking" in i3
        alt-w = "layout h_accordion"; # "layout tabbed" in i3
        alt-e = "layout tiles horizontal vertical"; # "layout toggle split" in i3
        alt-shift-space = "layout floating tiling"; # "floating toggle" in i3

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-0 = "workspace 10";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-0 = "move-node-to-workspace 10";

        alt-r = "mode resize";
        alt-tab = "workspace-back-and-forth";

        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
      };
      mode.resize.binding = {
        h = "resize width -50";
        j = "resize height +50";
        k = "resize height -50";
        l = "resize width +50";
        enter = "mode main";
        esc = "mode main";
      };
      workspace-to-monitor-force-assignment = {
        "1" = "^lg hdr 4K$";
        "2" = "^lg hdr 4K$";
        "3" = "^lg hdr 4K$";
        "4" = "^lg hdr 4K$";
        "5" = "^built-in retina display$";
        "6" = "^built-in retina display$";
        "7" = "^built-in retina display$";
        "8" = "^built-in retina display$";
        "9" = "^built-in retina display$";
      };
    };
  };
}
