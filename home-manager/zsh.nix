{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      styles = { "alias" = "fg=magenta"; };
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "sudo"
        "systemd"
      ];
    };
  };
}