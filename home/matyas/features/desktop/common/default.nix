{ pkgs, ... }:

let
  warp-terminal-overlay = final: prev: {
      warp-terminal = prev.warp-terminal.overrideAttrs {
        src = prev.fetchurl {
          url = "https://releases.warp.dev/stable/v0.2024.03.05.08.02.stable_01/warp-terminal-v0.2024.03.05.08.02.stable_01-1-x86_64.pkg.tar.zst";
          hash = "sha256-SZ4CR8KjGYIysuARGDmHcpFWavebqAIBhalWeRqh9C8=";
        };
      };
    };
in {
    nixpkgs.overlays = [ warp-terminal-overlay ];

    home.packages = with pkgs; [
        anytype
        
        google-chrome
        yubioath-flutter
        warp-terminal
    ];
}
