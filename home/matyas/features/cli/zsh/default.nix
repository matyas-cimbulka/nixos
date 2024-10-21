{ config, pkgs, ... }:

{
  home = {
    file.p10k-config = {
      enable = true;
      source = ./multi-line-p10k.zsh;
      target = "${config.home.homeDirectory}/.p10k.zsh";
    };
  };

  programs = {
    zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      initExtraFirst = "source ~/.p10k.zsh";
      initExtra = ''printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c' '';

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
          name = "gpg-agent";
          src = ./plugins;
          file = "gpg-agent.plugin.zsh";
        }
        {
          name = "sudo";
          src = ./plugins;
          file = "sudo.plugin.zsh";
        }
        {
          name = "systemd";
          src = ./plugins;
          file = "systemd.plugin.zsh";
        }
        {
          name = "autocomplete";
          src = pkgs.fetchFromGitHub {
            owner = "marlonrichert";
            repo = "zsh-autocomplete";
            rev = "23.07.13";
            sha256 = "0NW0TI//qFpUA2Hdx6NaYdQIIUpRSd0Y4NhwBbdssCs=";          
          };
          file = "zsh-autocomplete.plugin.zsh";
        }
      ];
    };

    oh-my-posh = {
      enable = false;

      settings = {
        blocks = [
          {
            alignment = "left";
            segments = [
              {
                background = "#29315A";
                foreground  = "#3EC669";
                leading_diamand  = "\ue0b6";
                properties = {
                  style = "mixed";
                };
                style = "diamond";
                template = "\ue5ff {{ .Path }}";
                traiing_diamand = "\ue0b4";
                type = "path";
              }
              {
                background   = "#29315A";
                foreground  = "#43CCEA";
                foreground_templates = [
                  "{{ if or (.Working.Changed) () }}"
                ];
                leading_diamand  = "\ue0b6";
                properties  = {
                  style  = "mixed";
                 };
                style  = "diamond";
                template  = "{{ .Shell.Name }}";
                traiing_diamand   = "\ue0c8";
                type  = "shell";
              }
            ];
          }
        ];
      };
    };
  };
}
