{
  description = "Devshell for building QMK firmware for MODE Envoy (mode/m256wh)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            qmk
            gnumake
            git
            (python3.withPackages (ps: [ ps.platformdirs ]))
            gcc-arm-embedded
            dfu-util
          ];
        };
      });
}
