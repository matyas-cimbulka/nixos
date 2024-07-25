{ pkgs, ... }:

let
    gitbutler-overlay = final: prev: {
        gitbutler = prev.gitbutler.overrideAttrs {
            version = "0.12.14";
            src = prev.fetchFromGitHub {
                owner = "gitbutlerapp";
                repo = "gitbutler";
                rev = "release/0.12.14";
                hash = "sha256-mTmJYguJN11/fTEskeu416boy1+m0WkdTefqybHic3Q=";
            };
            cargoLock = {
                lockFile = ./Cargo.lock;
                cargoHash = "";
            };
        };
    };
in {
    
    nixpkgs.overlays = [ gitbutler-overlay ];

    home.packages = with pkgs; [
        # anytype
        # _1password-gui-beta
        blackbox-terminal
        gitbutler
        google-chrome
        yubioath-flutter
        warp-terminal
    ];
}
