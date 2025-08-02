
[owner@nixos:~/sync/sturdy-adventure]$ nix build --print-build-logs
warning: Git tree '/home/owner/sync/sturdy-adventure' is dirty
libbf> Running phase: unpackPhase
libbf> unpacking source archive /nix/store/s1zxypplhv5i6f793bccfaffccgqi1s1-source
libbf> source root is source

. . .

libbf> shrinking RPATHs of ELF executables and libraries in /nix/store/k3n73f7w07llq1f4phaf3lqrc4y2lj57-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0
libbf> shrinking /nix/store/k3n73f7w07llq1f4phaf3lqrc4y2lj57-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0/lib/libbf.so.70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0
libbf> checking for references to /build/ in /nix/store/k3n73f7w07llq1f4phaf3lqrc4y2lj57-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0...
libbf> patching script interpreter paths in /nix/store/k3n73f7w07llq1f4phaf3lqrc4y2lj57-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0
libbf> stripping (with command strip and flags -S -p) in  /nix/store/k3n73f7w07llq1f4phaf3lqrc4y2lj57-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0/lib

[owner@nixos:~/sync/sturdy-adventure]$ nix develop
warning: Git tree '/home/owner/sync/sturdy-adventure' is dirty
LibBF development shell ready!

[libbf-dev:owner@nixos:~/sync/sturdy-adventure] gcc -o bfpi bfpi.c -Iresult/include -Lresult/lib -lbf -lm -Wl,-rpath="$PWD/result/lib"

[libbf-dev:owner@nixos:~/sync/sturdy-adventure] ./bfpi 1e4 pi_1e4.txt

[libbf-dev:owner@nixos:~/sync/sturdy-adventure] exit
exit

______________________________________________________________________

[owner@nixos:~/sync/sturdy-adventure]$ nix build --print-build-logs
warning: Git tree '/home/owner/sync/sturdy-adventure' is dirty
libbf> Running phase: unpackPhase
libbf> unpacking source archive /nix/store/s1zxypplhv5i6f793bccfaffccgqi1s1-source
libbf> source root is source
libbf> Unpacking source root:
libbf> total 12
libbf> -rw------- 1 nixbld nixbld 6761 Aug  2 21:02 env-vars
libbf> drwxr-xr-x 2 nixbld nixbld 4096 Jan  1  1970 source
libbf> ./source/softfp_template_icvt.h
libbf> ./source/libbf.h
libbf> ./source/cutils.h
libbf> ./source/readline.h
libbf> ./source/readline_tty.h
libbf> ./source/softfp_template.h
libbf> ./source/softfp.h
libbf> ./source/list.h
libbf> Running phase: patchPhase
libbf> Running phase: updateAutotoolsGnuConfigScriptsPhase
libbf> Running phase: configurePhase
libbf> no configure script, doing nothing
libbf> Running phase: buildPhase
libbf> gcc -fPIC -fPIC -c -o bfbench.o bfbench.c
libbf> gcc -fPIC -fPIC -c -o libbf.o libbf.c
libbf> gcc -fPIC -fPIC -c -o cutils.o cutils.c
libbf> gcc  -o bfbench bfbench.o libbf.o cutils.o -lm
libbf> gcc -fPIC -fPIC -c -o bfpi.o bfpi.c
libbf> gcc  -o bfpi bfpi.o libbf.o cutils.o -lm
libbf> gcc -fPIC -fPIC -c -o bfcalc.o bfcalc.c
libbf> bfcalc.c: In function 'load_file':
libbf> bfcalc.c:10594:5: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
libbf> 10594 |     fread(buf, 1, buf_len, f);
libbf>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
libbf> gcc -fPIC -fPIC -c -o readline_tty.o readline_tty.c
libbf> gcc -fPIC -fPIC -c -o readline.o readline.c
libbf> gcc  -o bfcalc bfcalc.o readline_tty.o readline.o libbf.o cutils.o -lm
libbf> Running phase: installPhase
libbf> 🔧 Entering installPhase...
libbf> Current working directory:
libbf> /build/source
libbf> 📄 Contents:
libbf> total 2128
libbf> -rw-r--r-- 1 nixbld nixbld   3351 Jan  1  1970 Makefile
libbf> -rw-r--r-- 1 nixbld nixbld     11 Jan  1  1970 VERSION
libbf> -rwxr-xr-x 1 nixbld nixbld 119464 Aug  2 21:02 bfbench
libbf> -rw-r--r-- 1 nixbld nixbld  10859 Jan  1  1970 bfbench.c
libbf> -rw-r--r-- 1 nixbld nixbld  10088 Aug  2 21:02 bfbench.o
libbf> -rwxr-xr-x 1 nixbld nixbld 298392 Aug  2 21:02 bfcalc
libbf> -rw-r--r-- 1 nixbld nixbld 304863 Jan  1  1970 bfcalc.c
libbf> -rw-r--r-- 1 nixbld nixbld 291440 Aug  2 21:02 bfcalc.o
libbf> -rwxr-xr-x 1 nixbld nixbld 119488 Aug  2 21:02 bfpi
libbf> -rw-r--r-- 1 nixbld nixbld   6982 Jan  1  1970 bfpi.c
libbf> -rw-r--r-- 1 nixbld nixbld   9536 Aug  2 21:02 bfpi.o
libbf> -rw-r--r-- 1 nixbld nixbld  57452 Jan  1  1970 bftest.c
libbf> -rw-r--r-- 1 nixbld nixbld   6105 Jan  1  1970 cutils.c
libbf> -rw-r--r-- 1 nixbld nixbld   4771 Jan  1  1970 cutils.h
libbf> -rw-r--r-- 1 nixbld nixbld   4840 Aug  2 21:02 cutils.o
libbf> -rw-r--r-- 1 nixbld nixbld 161456 Aug  2 21:02 libbf.a
libbf> -rw-r--r-- 1 nixbld nixbld 242338 Jan  1  1970 libbf.c
libbf> -rw-r--r-- 1 nixbld nixbld  18029 Jan  1  1970 libbf.h
libbf> -rw-r--r-- 1 nixbld nixbld 128208 Aug  2 21:02 libbf.o
libbf> -rwxr-xr-x 1 nixbld nixbld 144912 Aug  2 21:02 libbf.so
libbf> -rw-r--r-- 1 nixbld nixbld   3091 Jan  1  1970 list.h
libbf> -rw-r--r-- 1 nixbld nixbld     53 Jan  1  1970 pi_1e5.sha1sum
libbf> -rw-r--r-- 1 nixbld nixbld     53 Jan  1  1970 pi_1e6.sha1sum
libbf> -rw-r--r-- 1 nixbld nixbld     53 Jan  1  1970 pi_1e7.sha1sum
libbf> -rw-r--r-- 1 nixbld nixbld     53 Jan  1  1970 pi_1e8.sha1sum
libbf> -rw-r--r-- 1 nixbld nixbld     53 Jan  1  1970 pi_1e9.sha1sum
libbf> -rw-r--r-- 1 nixbld nixbld  21656 Jan  1  1970 readline.c
libbf> -rw-r--r-- 1 nixbld nixbld   3720 Jan  1  1970 readline.h
libbf> -rw-r--r-- 1 nixbld nixbld  13880 Aug  2 21:02 readline.o
libbf> -rw-r--r-- 1 nixbld nixbld   6149 Jan  1  1970 readline_tty.c
libbf> -rw-r--r-- 1 nixbld nixbld   1310 Jan  1  1970 readline_tty.h
libbf> -rw-r--r-- 1 nixbld nixbld   4488 Aug  2 21:02 readline_tty.o
libbf> -rw-r--r-- 1 nixbld nixbld   7638 Jan  1  1970 readme.txt
libbf> -rw-r--r-- 1 nixbld nixbld   2076 Jan  1  1970 softfp.c
libbf> -rw-r--r-- 1 nixbld nixbld   8238 Jan  1  1970 softfp.h
libbf> -rw-r--r-- 1 nixbld nixbld  25696 Aug  2 21:02 softfp.o
libbf> -rw-r--r-- 1 nixbld nixbld  30587 Jan  1  1970 softfp_template.h
libbf> -rw-r--r-- 1 nixbld nixbld   5823 Jan  1  1970 softfp_template_icvt.h
libbf> 📁 Creating output directories...
libbf> 📦 Copying libraries to /nix/store/dig77ki8cyhshpl40m569mln9wxpv8jr-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0/lib...
libbf> 📄 Copying headers from current directory...
libbf>   -> ./softfp_template_icvt.h
libbf>   -> ./libbf.h
libbf>   -> ./cutils.h
libbf>   -> ./readline.h
libbf>   -> ./readline_tty.h
libbf>   -> ./softfp_template.h
libbf>   -> ./softfp.h
libbf>   -> ./list.h
libbf> ✅ installPhase complete!
libbf> Running phase: fixupPhase
libbf> Moving /nix/store/dig77ki8cyhshpl40m569mln9wxpv8jr-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0/include to /nix/store/1v722bvhj2ibwa8ahfnws85vz8lijpqf-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0-dev/include
libbf> shrinking RPATHs of ELF executables and libraries in /nix/store/dig77ki8cyhshpl40m569mln9wxpv8jr-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0
libbf> shrinking /nix/store/dig77ki8cyhshpl40m569mln9wxpv8jr-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0/lib/libbf.so
libbf> checking for references to /build/ in /nix/store/dig77ki8cyhshpl40m569mln9wxpv8jr-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0...
libbf> patching script interpreter paths in /nix/store/dig77ki8cyhshpl40m569mln9wxpv8jr-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0
libbf> stripping (with command strip and flags -S -p) in  /nix/store/dig77ki8cyhshpl40m569mln9wxpv8jr-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0/lib
libbf> shrinking RPATHs of ELF executables and libraries in /nix/store/1v722bvhj2ibwa8ahfnws85vz8lijpqf-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0-dev
libbf> checking for references to /build/ in /nix/store/1v722bvhj2ibwa8ahfnws85vz8lijpqf-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0-dev...
libbf> patching script interpreter paths in /nix/store/1v722bvhj2ibwa8ahfnws85vz8lijpqf-libbf-70efcce85e9469bd312b8bd0a2d3b1c508e0d9a0-dev

[owner@nixos:~/sync/sturdy-adventure]$ ls -R /home/owner/sync/sturdy-adventure/result
/home/owner/sync/sturdy-adventure/result:
lib

/home/owner/sync/sturdy-adventure/result/lib:
libbf.a  libbf.so

[owner@nixos:~/sync/sturdy-adventure]$ nix develop
warning: Git tree '/home/owner/sync/sturdy-adventure' is dirty
LibBF development shell ready!
[libbf-dev:owner@nixos:~/sync/sturdy-adventure] 


looks like this flake.nix completed succesfully, how do we compile bfpi.c it has and include


#include <libbf/libbf.h>

gcc -o quad quad.c -lX11 -lGL -lGLU