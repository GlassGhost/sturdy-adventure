# build ex

`nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}' --keep-failed`

it will fail because no 'install' target in the makefile
