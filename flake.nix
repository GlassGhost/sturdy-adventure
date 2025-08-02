{
  description = "LibBF with embedded QuickJS headers, packaged as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
  in
  {
    packages.x86_64-linux.default =
######################################################################
      pkgs.callPackage (
        { lib
        , stdenv
        , fetchFromGitHub
        , pkg-config
        }:
        let
          quickjsSrc = fetchFromGitHub {
            owner = "bellard";
            repo  = "quickjs";
            rev   = "458c34d29d0d262f824ea1c0e01aa0e3790669da";
            hash  = "sha256-VMaxVVQuJ3DAwYrC14uJqlRBg0//ugYvtyhOXsTUbCA=";
          };
        in
        stdenv.mkDerivation rec {
          pname    = "libbf";
          version  = "70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0";

          src = fetchFromGitHub {
            owner = "GlassGhost";
            repo  = pname;
            rev   = version;
            sha256 = "sha256-wxELNSpAMOYQUGHiQFc8JF7jctwjbzjwifNVXrU6L+g=";
          };

          nativeBuildInputs = [ pkg-config ];

          postUnpack = ''
            cp -r ${quickjsSrc} quickjs
          '';

          postPatch = ''
            substituteInPlace Makefile \
              --replace "-I." "-I. -I$PWD/quickjs"
          '';

          buildPhase = ''
            export CFLAGS+=" -fPIC"
            make CFLAGS="$CFLAGS -fPIC" all

            gcc -fPIC -c softfp.c -o softfp.o

            gcc -shared -o libbf.so \
              libbf.o cutils.o softfp.o \
              -lm -Wl,-soname,libbf.so.${version}

            ar rcs libbf.a libbf.o cutils.o softfp.o
          '';

          installPhase = ''
            mkdir -p $out/{lib,include}
            cp libbf.so libbf.a $out/lib/
            [ -e $out/lib/libbf.so ] || ln -s libbf.so $out/lib/libbf.so
            cp *.h $out/include/
          '';

          outputs = [ "out" "dev" ];

          meta = {
            description = "LibBF with embedded QuickJS headers";
            homepage    = "https://bellard.org/libbf/";
            license     = lib.licenses.mit;
            platforms   = lib.platforms.unix;
            broken      = stdenv.hostPlatform.isAndroid;
          };
        }
      ) {}
######################################################################
  };
}
