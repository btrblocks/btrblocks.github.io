{
  description = "Development shell for btrblocks_blog-writing";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
    let
      forSystem = system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          devShells.default = pkgs.mkShell {
            packages = [
              pkgs.nodejs_22
              pkgs.gnumake
              pkgs.imagemagick
            ];
          };
        };
    in {
      devShells.x86_64-linux = (forSystem "x86_64-linux").devShells;
      devShells.aarch64-darwin = (forSystem "aarch64-darwin").devShells;
    };
}
