{ sources ? import nix/sources.nix
, nixpkgs ? sources.nixpkgs
, linux ? sources.linux
, system ? builtins.currentSystem
}:

let
  pkgs = import nixpkgs { inherit system; };

  rust-for-linux = {
    kernel = pkgs.callPackage ./kernel.nix {
      version = "5.11";
      src = linux;
    };
  };

in
  rust-for-linux
