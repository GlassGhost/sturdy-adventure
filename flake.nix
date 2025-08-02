{
  description = "LibBF packaged as a flake";

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

        stdenv.mkDerivation rec {
          pname    = "libbf";
          version  = "70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0";

          src = fetchFromGitHub {
            owner  = "GlassGhost";
            repo   = pname;
            rev    = version;
            sha256 = "sha256-wxELNSpAMOYQUGHiQFc8JF7jctwjbzjwifNVXrU6L+g=";
          };

          nativeBuildInputs = [ pkg-config ];

          postUnpack = ''
            echo "Unpacking source root:"
            ls -l
            find . -name '*.h'
          '';

          buildPhase = ''
            export CFLAGS+=" -fPIC"
            make CFLAGS="$CFLAGS -fPIC" all

            gcc -fPIC -c softfp.c -o softfp.o

            gcc -shared -o libbf.so.${version} \
              libbf.o cutils.o softfp.o \
              -lm -Wl,-soname,libbf.so.${version}

            ar rcs libbf.a libbf.o cutils.o softfp.o
          '';

          outputs = [ "out" ];  # disables dev/doc split
    #     outputs = [ "out" "dev" ]; # we need to provide .h files

        # nix build --print-build-logs to see the install logs
          installPhase = ''
              echo "Entering installPhase..."
              echo "Current working directory: $(pwd)"
              echo "Contents:"
              find . -type f

              echo "Creating output directories..."
              mkdir -p $out/lib
              mkdir -p $out/include/libbf

              echo "Copying libraries to $out/lib..."
              cp -v libbf.so.${version} libbf.a $out/lib/

              echo "Copying headers to $out/include/libbf..."
              find . -type f -name '*.h' -exec cp -v {} $out/include/libbf/ \;

              echo "installPhase complete!"
            '';

#           cp -v libbf.so libbf.a $out/lib/

          meta = {
            description = "LibBF";
            homepage    = "https://bellard.org/libbf/";
            license     = lib.licenses.mit;
            platforms   = lib.platforms.unix;
            broken      = stdenv.hostPlatform.isAndroid;
          };
        }
      ) {};
######################################################################
    devShells.x86_64-linux.default = pkgs.mkShell {
      name = "libbf-dev-shell";

      inputsFrom = [ self.packages.x86_64-linux.default ];

      buildInputs = with pkgs; [
        gcc
        gnumake
      ];

      shellHook = ''
        echo "LibBF development shell ready!"

        export CFLAGS="-I${self.packages.x86_64-linux.default}/include"
        export LDFLAGS="-L${self.packages.x86_64-linux.default}/lib -lbf"

        export PS1="[libbf-dev:\u@\h:\w] "
      '';
    };
  };
}
