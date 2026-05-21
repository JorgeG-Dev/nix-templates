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
        python = {
          path = ./templates/python;
          description = "Python Devshell";
        };
        rust = {
          path = ./templates/rust;
          description = "Rust Devshell";
        };
        zig = {
          path = ./templates/zig;
          description = "Zig Devshell";
        };
        default = self.templates.c;
      };
    };
}
