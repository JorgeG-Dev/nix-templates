{
  description = "C Devshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
        "aarch64-linux"
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              cmake
              gnumake
              gcc

              # Using the unwrapped version because we only need format, tidy,
              #and LSP which uses a compile_commands.json
              llvmPackages_22.clang-unwrapped
            ];
          };
        };
    };

}
