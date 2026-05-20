{
  # Declares flake inputs
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    devshell.url = "github:numtide/devshell";
    import-tree.url = "github:vic/import-tree";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
        "x86_64-darwin"
      ];
      imports = [
        inputs.devshell.flakeModule
        (inputs.import-tree ./shells)
      ];
    };
}
