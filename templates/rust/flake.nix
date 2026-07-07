{
  description = "Rust Devshell";

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
              rustup

              # Used for final linking of output
              gcc

              # This is used for any crates that have
              # dependency on system libraries
              pkg-config

              # Any crates that have a dependency on a system library,
              # add it here. Ex: glib

            ];

            # Sets the rust environment properly and installs the stable toolchain
            # if not installed already
            shellHook = ''
              export RUSTUP_HOME="$PWD/.rustup"
              export CARGO_HOME="$PWD/.cargo"
              export PATH="$CARGO_HOME/bin:$PATH"

              if [ ! -e "$CARGO_HOME/bin/rustc" ]; then
                rustup toolchain install stable
                rustup default stable
                rustup component add rust-src rustfmt clippy rust-analyzer
              fi
            '';
          };
        };
    };

}
