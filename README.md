# nix-templates 

The purpose of this repo is to provide Nix based dev project templates for
the languages/environments I like working in or am interested in. The following
templates are provided:

- `C`
- `Python`
- `Rust`
- `Zig`

The reason I went with templates over a single flake with multiple devshell
outputs was because templates are easier to modify and add onto without having
to do much Nix programming. You can just `nix flake init` with a template and
modify as you see fit. Whereas a flake with multiple outputs requires either
setting the flake as an input to your own custom flake or having some sort
of script that just does a `nix develop` or something on a pinned version of
the repo. In short, templates are easier to work with, especially if you're
not familiar with Nix.

This repo is very much my take on what I like to set up for projects based
on the language. There's probably better ways of structuring projects, but
for now this is what I've used and liked throughout my experience.

## How to Use

>[!NOTE]
> It is assumed that `nix` is installed on the system where the project is being
> set up.

To initialize a project using one of the templates, the following command can
be used

```bash
nix flake init -t github:JorgeG-Dev/nix-templates#<desired template>
```

The following is an example of how to initialize a C project using a template

```bash
nix flake init -t github:JorgeG-Dev/nix-templates#c
```
> [!NOTE]
> The desired language template should be all lowercase. Check out the
> `templates` folder for the correct way to specify a template

## Per Template Info

### C

Depending on the C application being developed, you may need to link against
a system library like glib or openssl. You should be able to initialize a
project with the template and just add whatever dependencies you need to the 
`packages` list in `flake.nix`. If it exists in the Nix package repo, you 
should be good.

### Rust

Same as C, any sort of system libraries you need to link against, just add
them in the `packages` in `flake.nix`. `gcc` is added as a package for the
final linking of the rust crates being built. Instead of using the system's
compiler, the devshell provides one to ensure consistency.

### Python

I like `uv`, it manages Python virtual environments and packages well. It's
much more straightforward providing `uv` and configuring the Python version
and `pip` packages through there.

### Zig

I have no experience with Zig, so not sure what to add beyond the compiler
and the LSP. ¯\_(ツ)_/¯

## Pending Work

- Adding more stuff to the C template to bootstrap projects quicker. Think
along the lines of a `.clang-tidy` file, some template `CMakeLists.txt`, etc.
- An Embedded C template. I'm an embedded developer, I love working in embedded
C. Ironically, a template for this wasn't created.
