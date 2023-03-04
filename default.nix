{ lib, stdenv
, fetchFromGitHub
, breakpointHook
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "libbf";
  version = "773576d970899248c9a1d29ea57fd37f92970ebd";
  #https://github.com/GlassGhost/libbf

  src = builtins.fetchTarball https://bellard.org/libbf/libbf-2020-01-19.tar.gz;

  nativeBuildInputs = [ pkg-config ];

  outputs = [ "out" "dev" ];
  #outputs = [ "out" ];

  meta = {
    description = "LibBF library";
    homepage = "https://bellard.org/libbf/";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    broken = stdenv.hostPlatform.isAndroid;
  };
}
