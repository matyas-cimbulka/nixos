{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home = {
    packages = [
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];

    file.p10k-config = {
      enable = true;
      source = ./p10k.zsh;
      target = "${config.home.homeDirectory}/.p10k.zsh";
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = "source ~/.p10k.zsh";
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "gpg-agent"
        "sudo"
        "systemd"
      ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}
