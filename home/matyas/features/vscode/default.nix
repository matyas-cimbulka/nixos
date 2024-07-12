{ pkgs, ... }:

{
    programs.vscode = {
        enable = true;

        extensions = with pkgs.vscode-extensions; [
            eamodio.gitlens
            bbenoist.nix

            hashicorp.terraform
            pkief.material-icon-theme

            rust-lang.rust-analyzer
            serayuzgur.crates
            tamasfe.even-better-toml
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "bracket-pair-color-dlw";
                publisher = "BracketPairColorDLW";
                version = "0.0.6";
                sha256 = "WB929LJWf7jbCkWoNnQaSkQxETxN4xtJJHwsLk2+dmw=";
            }
        ];

        userSettings = {
            "debug.console.fontFamily" = "FiraMono Nerd Font";
            "terminal.integrated.fontFamily" = "FiraMono Nerd Font";
            "explorer.confirmDelete" = false;
            "svelte.enable-ts-plugin" = true;
            "[terraform]" = {
                "editor.tabSize" = 2;
            };
            "terminal.external.linuxExec" = "warp-terminal";
            "workbench.iconTheme" = "material-icon-theme";
            "editor.formatOnSave" = true;
        };
    };
}
