{
  description = "Dev shell templates for each language";

  outputs =
    { self, ... }:
    {
      templates = {
        c = {
          path = ./templates/c;
          description = "C Devshell";
        };
        default = self.templates.c;
      };
    };
}
