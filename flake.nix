{
  description = "flake template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./empty-repo) ];
      };
    in
    {
      formatter."${system}" = pkgs.nixpkgs-fmt;
    };
}
