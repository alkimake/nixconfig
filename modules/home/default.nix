# A module that automatically imports everything else in the parent folder.
# FIXME: ignore darwin-* if operating system is nixos
# ignore nixos-* if the operating system is darwin
{
  imports =
    with builtins;
    map
      (fn: ./${fn})
      (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));
}
