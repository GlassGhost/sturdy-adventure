
# { lib, stdenv
# , fetchFromGitHub
# , breakpointHook
# , pkg-config
# }:
with import <nixpkgs> {}; # bring all of Nixpkgs into scope

stdenv.mkDerivation rec {
  pname = "libbf";
  version = "773576d970899248c9a1d29ea57fd37f92970ebd";
  #https://github.com/GlassGhost/libbf

#   src = builtins.fetchTarball https://bellard.org/libbf/libbf-2020-01-19.tar.gz;
  src = fetchFromGitHub {
    owner = "GlassGhost";
    repo = pname;
    rev = version;
    sha256 = "";
  };

  buildInputs = [ ];
  nativeBuildInputs = [ pkg-config ];
  propagatedBuildInputs = [ ];
#      ++ lib.optional stdenv.isDarwin ApplicationServices;
  preConfigure = ''
  '';

  installPhase = ''
  mkdir -p $out/lib
  mkdir -p $out/include
  find . -iname "*libbf*.o" -exec cp -t $out/lib/ {} \;
  find . -iname "*libbf*.h" -exec cp -t $out/include/ {} \;
  '';

  outputs = [ "out" "dev" ];

  meta = {
    description = "LibBF library";
    homepage = "https://bellard.org/libbf/";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    #broken = stdenv.hostPlatform.isAndroid;
  };
}
