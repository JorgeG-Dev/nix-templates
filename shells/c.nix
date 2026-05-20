{ ... }:
{
  perSystem =
    { config, pkgs, ... }:
    {
      devshells.c = {
        commands = [
          {
            help = "print hello";
            name = "hello";
            command = "echo hello";
          }
        ];
      };
    };
}
