{ config, pkgs, ... }:

{
  home = {
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

    shellAliases = {
      cat = "bat --paging=never";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "sudo";
        src = ./plugins/sudo.plugin.zsh;
      }
      {
        name = "systemd";
        src = ./plugins/systemd.plugin.zsh;
      }
    ];
  };
}
