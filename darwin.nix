{ pkgs, ... }:
{
  system.primaryUser = "zasda";

  users.users.zasda = {
    name = "zasda";
    home = "/Users/zasda";
  };

  # Determinate Nix will manage nix configuration instead.
  nix.enable = false;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Dock
  system.defaults.dock.autohide = true;
  system.defaults.dock.launchanim = false;
  system.defaults.dock.mineffect = "scale";
  system.defaults.dock.minimize-to-application = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.dock.orientation = "left";
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 32;

  # Trackpad
  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadRightClick = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  # Keyboard
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.fish.enable = true;
  programs.zsh.enable = true;

  homebrew.enable = true;
  homebrew.casks = [
    "beekeeper-studio"
    "betterdisplay"
    "brave-browser"
    "ghostty"
    "raycast"
    "visual-studio-code"
    "zed"
  ];
  homebrew.masApps = {
    Wireguard = 1451685025;
  };
}
