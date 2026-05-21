{ ... }:
{
  perSystem =
    { config, pkgs, ... }:
    {
      devshells.c = {
        packages = [
          pkgs.cmake # Build System Generator
          pkgs.gnumake # Build System
          pkgs.gcc # Compiler
          pkgs.llvmPackages_22.clang-tools # LSP, formatter, etc
        ];
      };
    };
}
