_: {
  programs.k9s = {
    enable = true;
    plugins = {
      fred = {
        shortCut = "Ctrl-L";
        description = "Pod logs";
        scopes = ["po"];
        command = "kubectl";
        background = false;
        args = [
          "logs"
          "-f"
          "$NAME"
          "-n"
          "$NAMESPACE"
          "--context"
          "$CLUSTER"
        ];
      };
    };
  };
  catppuccin.enable = true;
}
