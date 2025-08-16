{ pkgs, ... }:
{
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.btop
    pkgs.croc
    pkgs.d2
    pkgs.fd
    pkgs.jq
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.nixfmt-rfc-style
    pkgs.ripgrep
    pkgs.sd
    pkgs.tcpdump
    pkgs.tcptraceroute
    pkgs.yq
  ];

  programs.home-manager.enable = true;

  programs.helix.enable = true;
  programs.helix.defaultEditor = true;
  programs.helix.package = pkgs.evil-helix;
  programs.helix.settings = {
    theme = "github_light";
  };

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    set fish_greeting
    fish_config theme choose None
  '';
  programs.fish.functions = {
    glog = "git log --oneline --decorate --graph $argv";
    ggpush = "git push origin (git branch --show-current) $argv";
    ggpull = "git pull origin (git branch --show-current) $argv";
    grt = "cd (git rev-parse --show-toplevel || echo '.')";
    gcs = "git commit -S $argv";
  };

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.settings = {
    format = "$username$hostname$directory$git_branch$git_commit$git_state$git_status$kubernetes$aws$gcloud$line_break$character";

    aws = {
      format = ''\[[aws:($profile)(\($region\))(\[$duration\])]($style)\]'';
    };

    gcloud = {
      disabled = true;
      format = ''\[[gcp:$project(\($region\))]($style)\]'';
    };

    git_branch = {
      format = ''\[[$symbol$branch]($style)\]'';
    };

    git_status = {
      format = ''([\[$all_status$ahead_behind\]]($style))'';
    };

    kubernetes = {
      disabled = false;
      format = ''\[[kube:$context(\($namespace\))]($style)\]'';
    };
  };

  programs.fzf.enable = true;
  programs.fzf.enableFishIntegration = true;
  programs.fzf.defaultOptions = [ "--no-color" ];

  programs.ghostty.enable = true;
  programs.ghostty.package = null;
  programs.ghostty.enableFishIntegration = true;
  programs.ghostty.settings = {
    command = "/run/current-system/sw/bin/fish";
    font-family = "TX-02";
    font-size = 14;
    macos-titlebar-proxy-icon = "hidden";
    theme = "dark:GitHub-Dark-Default,light:GitHub-Light-Default";
    window-padding-x = 8;
  };

  programs.bun.enable = true;
  programs.bun.settings = {
    telemetry = false;
  };

  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;
}
