{ ... }:
{
  perSystem =
    { config, pkgs, ... }:
    {
      devshells.c = {
        command = [
          {
            help = "print hello";
            name = "hello";
            command = "echo hello";
          }
        ];
      };
    };
}
