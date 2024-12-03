{
  pkgs,
  ...
}: {
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    extraPackages = with pkgs; [
      jq
      sketchybar-app-font
    ];
    config = ''
      #!/bin/bash

      PLUGIN_DIR="$CONFIG_DIR/plugins"
      ITEM_DIR="$CONFIG_DIR/items"

      sketchybar --bar \
        height=32 \
        blur_radius=50 \
        position=top \
        sticky=on \
        padding_left=10 \
        padding_right=10 \
        color=0xff1e1e2e

      sketchybar --default \
        background.height=32 \
        background.color=0xff3c3e4f \
        background.corner_radius=5 \
        icon.font="SF Pro:Bold:14.0" \
        icon.padding_left=4 \
        icon.padding_right=4 \
        label.font="SF Pro:Bold:14.0" \
        label.padding_left=4 \
        label.padding_right=4

      # Left
      sketchybar --add space space_separator left \
                 --set space_separator \
                   background.height=32 \
                   background.color=0xff3c3e4f

      # Center
      sketchybar --add item front_app center \
                 --set front_app \
                   icon.drawing=off \
                   label.font="SF Pro:Bold:14.0" \
                   background.height=32 \
                   background.color=0xff3c3e4f

      # Right
      sketchybar --add item clock right \
                 --set clock \
                   update_freq=10 \
                   script="date '+%H:%M'" \
                   background.height=32 \
                   background.color=0xff3c3e4f

      sketchybar --add item battery right \
                 --set battery \
                   update_freq=120 \
                   script="$PLUGIN_DIR/battery.sh" \
                   background.height=32 \
                   background.color=0xff3c3e4f

      mkdir -p "$PLUGIN_DIR"
      cat > "$PLUGIN_DIR/battery.sh" << EOF
        #!/bin/bash
        PERCENTAGE=\$(pmset -g batt | grep -Eo "\\d+%" | cut -d% -f1)
        CHARGING=\$(pmset -g batt | grep 'AC Power')

        if [ \$PERCENTAGE = "" ]; then
          exit 0
        fi

        case \$${PERCENTAGE} in
          9[0-9]|100) ICON="􀛨"
          ;;
          [6-8][0-9]) ICON="􀺸"
          ;;
          [3-5][0-9]) ICON="􀺶"
          ;;
          [1-2][0-9]) ICON="􀛩"
          ;;
          *) ICON="􀛪"
        esac

        if [[ \$CHARGING != "" ]]; then
          ICON="􀢋"
        fi

        sketchybar --set \$NAME icon="\$ICON" label="\$${PERCENTAGE}%"
      EOF
      chmod +x "$PLUGIN_DIR/battery.sh"
    '';
  };

  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
}
