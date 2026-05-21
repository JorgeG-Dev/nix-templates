{ ... }:
{
  perSystem =
    { config, pkgs, ... }:
    {
      devshells.python = {
        packages = [
          pkgs.uv # uv will handle things using a venv
        ];
      };
    };
}
