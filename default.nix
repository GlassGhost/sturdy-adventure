{ lib, stdenv
, fetchFromGitHub
, breakpointHook
, pkg-config
#, quickjs
#, ApplicationServices
}:

stdenv.mkDerivation rec {
  pname = "libbf";
  version = "773576d970899248c9a1d29ea57fd37f92970ebd";
  #https://github.com/GlassGhost/libbf

#  srcs = [
#    (fetchFromGitHub {
#      owner = "GlassGhost";
#      repo = pname;
#      rev = version;
#      sha256 = "sha256-HU5R0JG32Z6jcWsQDtlBzjfNHbnQxUcuyM9Nbob8xwQ=";
#    })
#    (fetchFromGitHub {
#      owner = "bellard";
#      repo = "quickjs";
#      rev = "b5e62895c619d4ffc75c9d822c8d85f1ece77e5b";
#      hash = "sha256-VMaxVVQuJ3DAwYrC14uJqlRBg0//ugYvtyhOXsTUbCA=";
#    })
#  ];

#  sourceRoot = "./libbf";

#  unpackPhase = '' 
#    runHook preUnpack
#
#    for _src in $srcs; do
#      cp "$_src" $(stripHash "$_src")
#    done
#
#    runHook postUnpack
#  '';

#  src = fetchFromGitHub {
#    owner = "GlassGhost";
#    repo = pname;
#    rev = version;
#    sha256 = "sha256-HU5R0JG32Z6jcWsQDtlBzjfNHbnQxUcuyM9Nbob8xwQ=";
#  };

  src = builtins.fetchTarball https://bellard.org/libbf/libbf-2020-01-19.tar.gz;

  nativeBuildInputs = [ pkg-config ];

#  buildInputs = [ quickjs.dev ];
  #nativeBuildInputs = [ breakpointHook pkg-config quickjs.dev ];

  #propagatedBuildInputs = [ libBF ]
  #  ++ lib.optional stdenv.isDarwin ApplicationServices;

#  patches = [ ./add-quickjs-cflags.patch ];

 # postPatch = ''
 #   sed -e "s@%QUICKJS%@${quickjs.dev}/include/quickjs/@" -i Makefile
 # '';

  outputs = [ "out" "dev" ];
  #outputs = [ "out" ];

  #configureFlags = [ "-I${quickjs.dev}" ];

  meta = {
    description = "LibBF library";
    homepage = "https://bellard.org/libbf/";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    broken = stdenv.hostPlatform.isAndroid;
  };
}
