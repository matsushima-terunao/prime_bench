# v1
## bench
```
2012
IE8 i5 2.53      JavaScript: size = 100000, count = 100, total = 9592, time(us) = 107100
IE9 i7 2.00      JavaScript: size = 100000, count = 10000, total = 9592, time(us) = 2675.4
IE9 x64 i7 2.00  JavaScript: size = 100000, count = 1000, total = 9592, time(us) = 24305 
Firefox6 i5 2.53 JavaScript: size = 100000, count = 10000, total = 9592, time(us) = 5765
Chrome15 i5 2.53 JavaScript: size = 100000, count = 10000, total = 9592, time(us) = 7551.4
PM 1.60 C        : size = 100000, count = 10000, total = 9592, time(us) = 1443.000000
i7 2.00 C        : size = 100000, count = 10000, total = 9592, time(us) = 510.300000
i7 2.00 asm      : size = 100000, count = 10000, total = 9592, time(us) = 500
i5 2.53 C#       : size = 100000, count = 10000, total = 9592, time(us) = 576.10879
i7 2.00 C#       : size = 100000, count = 10000, total = 9592, time(us) = 606.93283
i7 2.00 C#(Debug): size = 100000, count = 10000, total = 9592, time(us) = 2147.8423
i5 2.53 Java     : size = 100000, count = 10000, total = 9592, time(us) = 641.5

2020/5/29
MacBook Pro i5
Intel(R) Core(TM) i5-7360U CPU @ 2.30GHz 2core 4thread 2.30-3.60
gcc 11.0.0 (clang-1100.0.33.17) 100000 10000 9592 0m7.447s 744.7us
gcc 11.0.0 (clang-1100.0.33.17) 1000000 1000 78498 0m8.192s 8192us
clang 11.0.0 (clang-1100.0.33.17) 10000 100000 9592 0m7.887s 788.7us
clang 11.0.0 (clang-1100.0.33.17) 100000 10000 78498 0m6.597s 6597us
gcc -O3 11.0.0 (clang-1100.0.33.17) 100000 10000 9592 0m3.099s 309.9us
gcc -O3 11.0.0 (clang-1100.0.33.17) 1000000 1000 78498 0m4.168s 4168us
clang -O3 11.0.0 (clang-1100.0.33.17) 10000 100000 9592 0m3.015s 301.5us
clang -O3 11.0.0 (clang-1100.0.33.17) 100000 10000 78498 0m4.346s 4346us
python 2.7.16 100000 10000 9592 2m24.189s 14418.9us
python 2.7.16 1000000 1000 78498 3m1.063s 181063us
Python 2.7.13 (?, Apr 17 2020, 16:29:31)
[PyPy 7.3.1 with GCC 4.2.1 Compatible Apple LLVM 11.0.0 (clang-1100.0.33.17)]
python PyPy 7.3.1 100000 10000 9592 0m13.970s 1397.0us
python PyPy 7.3.1 1000000 1000 78498 0m16.363s 16363us
PHP 7.1.33 10 size = 100000, count = 10000, total = 9592 1m43.518s 10351.8us
PHP 7.1.33 10 size = 1000000, count = 1000, total = 78498 3m0.477s 180477us
ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]
ruby 2.3.7p 100000 1000 0m20.887s
ruby 2.3.7p 1000000 100 0m21.852s
java 13.0.2 2020-01-14 100000 10000 9592 0m4.858s 485.8us
java 13.0.2 2020-01-14 1000000 1000 78498 0m6.119s 6199us
Chrome 83.0.4103.61 JavaScript: size = 100000, count = 10000, total = 9592, time(us) = 954.2
Chrome 83.0.4103.61 JavaScript: size = 1000000, count = 1000, total = 78498, time(us) = 9857
Safari 13.1.1 (14609.2.9.1.3 JavaScript: size = 100000, count = 10000, total = 9592, time(us) = 911.5
Safari 13.1.1 (14609.2.9.1.3 JavaScript: size = 1000000, count = 1000, total = 78498, time(us) = 13298

2020/5/30
Mouse Computer i7-8750H 2.20 GHz-4.10 GHz
Chrome バージョン: 83.0.4103.61（Official Build） （64 ビット）
JavaScript: size = 100000, count = 10000, total = 9592, time(us) = 1064
JavaScript: size = 1000000, count = 1000, total = 78498, time(us) = 11363
asm: size = 100000, count = 10000, total = 9593, time(us) = 359
c: size = 100000, count = 10000, total = 9592, time(us) = 350.500000
6/4
java version "14.0.1" 2020-04-14
Java: size = 100000, count = 10000, total = 9592, time(us) = 368.6
Java: size = 1000000, count = 1000, total = 78498, time(us) = 6990.0
VisualStudio.16.Release/16.4.2+29613.14
Microsoft .NET Framework Version 4.8.03752
C# ツール   3.4.1-beta4-19610-02+c4e5d138903b899477649a17f197abd2bcb22f9e
C#: size = 100000, count = 10000, total = 9592, time(us) = 382.53682
C#: size = 1000000, count = 1000, total = 78498, time(us) = 4634.9431

2020/6/1
paiza.io
8t 3600MHz
C 280 3500
java 13.0.1 2020-01-14 490 5600
Python 2.7.17 11100 148000
PHP 7.4.1 7000 131000
Ruby: size = 100000, count = 10, total = 9592, time(us) = 31000
Ruby: size = 1000000, count = 5, total = 78498, time(us) = 272000
JavaScript: size = 100000, count = 100, total = 9592, time(us) = 1340
JavaScript: size = 1000000, count = 100, total = 78498, time(us) = 18080
2020/8/18
C#: size = 100000, count = 1000, total = 9592, time(us) = 516.1784
C#: size = 1000000, count = 100, total = 78498, time(us) = 5244.843
```

====
# v2
## prime_bench
```
c
2020/8/28

mac
prime_bench$ gcc --version
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/4.2.1
Apple clang version 11.0.0 (clang-1100.0.33.17)
Target: x86_64-apple-darwin18.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

prime_bench$ clang --version
Apple clang version 11.0.0 (clang-1100.0.33.17)
Target: x86_64-apple-darwin18.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

prime_bench$ gcc -O3 prime_bench.c

prime_bench$ time ./a.out 1000000 1000
prime count = 78498

real	0m8.555s
user	0m8.478s
sys	0m0.020s

prime_bench$ gcc prime_benchasm.asm

prime_bench$ time ./a.out 1000000 1000
prime count = 78498

real	0m3.331s
user	0m3.269s
sys	0m0.017s

0m8.518s	gcc
0m3.340s	gcc -O3
0m8.580s	clang
0m3.491s	clang -O3
0m3.124s	bit array

win
Microsoft Visual Studio Community 2019
Version 16.4.2
VisualStudio.16.Release/16.4.2+29613.14
Microsoft .NET Framework
Version 4.8.03752

インストールされているバージョン:Community

Visual C++ 2019   00435-60000-00000-AA302
Microsoft Visual C++ 2019

C# ツール   3.4.1-beta4-19610-02+c4e5d138903b899477649a17f197abd2bcb22f9e

PS prime_bench> powershell -C (Measure-Command {.\x64\Release\prime_bench.exe 1000000 1000}).TotalSeconds
4.2869933

optimize /O2 /Ob2 /Oi /Ot /Oy /GT /GL
PS prime_bench> powershell -C (Measure-Command {.\x64\Release\prime_bench.exe 1000000 1000}).TotalSeconds
3.4910001

---
asm
2020/8/31
		win		linux
rax		ret		ret/sse reg num
rcx		p1		p4
rdx		p2		p3
rdi		save	p1
rsi		save	p2
rbx		save	save
rbp		save	save
rsp		save	save
r8-9	p3-4	p5-6
r10-11
r12-15	save	save
xm0		p1/ret	p1/ret
xm1-3	p2-4	p2-4
xm4-7			p5-8
xm6-15	save

mac
prime_bench_asm$ gcc prime_benchasm.asm

prime_bench_asm$ time ./a.out 1000000 1000
prime count = 78498

real	0m3.326s
user	0m3.280s
sys	0m0.013s
0m3.318s VMX2(256bit) popcnt
0m3.333s vpaddb,vpmaddubsw,vphaddw

win
prime_bench>"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\ml64.exe" /?
Microsoft (R) Macro Assembler (x64) Version 14.24.28314.0

ソリューション エクスプローラー -> プロジェクト prime_bench_asm を選択
プロジェクト -> ビルドのカスタマイズ... -> [v]masm(.targets, .props)
ソリューション エクスプローラー -> prime_benchasm.asm -> プロパティー -> 項目の種類: Microsoft Macro Assembler

PS prime_bench> powershell -C (Measure-Command {.\x64\Release\prime_bench_asm.exe 1000000 1000}).TotalSeconds
3.7608167
3.4607179 VMX2(256bit) popcnt
3.4851989 VMX2(256bit) vpaddb,vpmaddubsw,vphaddw

----
java
2020/8/28

mac
prime_bench$ javac --version
javac 13.0.2

prime_bench$ java --version
java 13.0.2 2020-01-14
Java(TM) SE Runtime Environment (build 13.0.2+8)
Java HotSpot(TM) 64-Bit Server VM (build 13.0.2+8, mixed mode, sharing)

prime_bench$ javac prime_bench.java

prime_bench$ time java prime_bench 1000000 1000
prime count = 78498
time(ms) = 4732

real	0m4.913s
user	0m4.635s
sys	0m0.426s

win
prime_bench>"C:\Program Files\Java\jdk-14.0.2\bin\javac.exe" --version
javac 14.0.2

prime_bench>"C:\Program Files\Java\jdk-14.0.2\bin\java.exe" --version
java 14.0.2 2020-07-14
Java(TM) SE Runtime Environment (build 14.0.2+12-46)
Java HotSpot(TM) 64-Bit Server VM (build 14.0.2+12-46, mixed mode, sharing)

prime_bench>"C:\Program Files\Java\jdk-14.0.2\bin\javac.exe" prime_bench.java

prime_bench>"C:\Program Files\Java\jdk-14.0.2\bin\java.exe" prime_bench 1000000 1000
prime count = 78498
time(ms) = 6281

PS prime_bench> powershell -C (Measure-Command {& "C:\Program Files\Java\jdk-14.0.2\bin\java.exe" prime_bench 1000000 1000}).TotalSeconds
6.3154584

----
c#
2020/8/27

mac
=== Visual Studio Community 2019 for Mac ===

Version 8.6.3 (build 30)
Installation UUID: e83439c4-5916-46aa-abd6-09a86d1a5e41
	GTK+ 2.24.23 (Raleigh theme)
	Xamarin.Mac 6.18.0.23 (d16-6 / 088c73638)

	Package version: 610000104

=== Mono Framework MDK ===

Runtime:
	Mono 6.10.0.104 (2019-12/5d03a6fe116) (64-bit)
	Package version: 610000104

=== Roslyn (Language Service) ===

3.6.0-3.20210.9+4eafdcb1bcbd8d3573f2ba6065e56d9b9ce4f8a3

=== NuGet ===

バージョン: 5.6.0.6591

=== .NET Core SDK ===

SDK: /usr/local/share/dotnet/sdk/3.1.300/Sdks
SDK バージョン:
	3.1.300
	3.1.202
	3.1.200
MSBuild SDK: /Library/Frameworks/Mono.framework/Versions/6.10.0/lib/mono/msbuild/Current/bin/Sdks

=== .NET Core Runtime ===

ランタイム: /usr/local/share/dotnet/dotnet
ランタイム バージョン:
	3.1.4
	3.1.2
	2.1.18
	2.1.17
	2.1.16

prime_bench$ mono --version
Mono JIT compiler version 6.10.0.104 (2019-12/5d03a6fe116 Wed Apr 29 20:51:09 EDT 2020)
Copyright (C) 2002-2014 Novell, Inc, Xamarin Inc and Contributors. www.mono-project.com
	TLS:
	SIGSEGV:       altstack
	Notification:  kqueue
	Architecture:  amd64
	Disabled:      none
	Misc:          softdebug
	Interpreter:   yes
	LLVM:          yes(610)
	Suspend:       hybrid
	GC:            sgen (concurrent by default)

vs
prime count = 78498
time(ms) = 5325.9231

prime_bench_cs$ mono bin/Release/netcoreapp3.1/prime_bench_cs.dll 1000000 1000
prime count = 78498
time(ms) = 9628.0378

win
prime_bench>.\prime_bench_cs\bin\Release\netcoreapp3.1\prime_bench_cs.exe 1000000 1000
time(ms) = 7745.7969

PS prime_bench> powershell -C (Measure-Command {.\prime_bench_cs\bin\Release\netcoreapp3.1\prime_bench_cs.exe 1000000 1000}).TotalSeconds
6.0279881

----
javascript
2020/9/5

win
chrome
バージョン: 84.0.4147.125（Official Build） （64 ビット）
prime count = 78498
time(ms) = 10122

Microsoft Edge
バージョン 85.0.564.44 (公式ビルド) (64 ビット)
prime count = 78498
time(ms) = 9480

mac
chrome
バージョン: 85.0.4183.83（Official Build） （64 ビット）
prime count = 78498
time(ms) = 9884

safari
バージョン13.1.2 (14609.3.5.1.5)
prime count = 78498
time(ms) = 10573

prime_bench$ node --version
v14.8.0

prime_bench$ time node prime_bench.js 1000000 1000
prime count = 78498

real	0m17.362s
user	0m14.404s
sys	0m2.801s

----
python
2020/9/6

mac
prime_bench$ python --version
Python 2.7.16

prime_bench$ time python prime_bench.py 1000000 1000
prime count = 78498

real	3m11.256s
user	3m10.079s
sys	0m0.266s

prime_bench$ python
Python 2.7.16 (default, Jan 27 2020, 04:46:15)
[GCC 4.2.1 Compatible Apple LLVM 10.0.1 (clang-1001.0.37.14)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import py_compile
>>> py_compile.compile('prime_bench.py')
>>> exit()

prime_bench$ time python prime_bench.pyc 1000000 1000
prime count = 78498

real	3m12.255s
user	3m10.987s
sys	0m0.277s

prime_bench$ pypy --version
Python 2.7.13 (?, Apr 17 2020, 16:29:31)
[PyPy 7.3.1 with GCC 4.2.1 Compatible Apple LLVM 11.0.0 (clang-1100.0.33.17)]

prime_bench$ time pypy prime_bench.py 1000000 1000
prime count = 78498

real	0m26.918s
user	0m26.760s
sys	0m0.070s

python 191.256
py_compile 192.255
pypy 26.918

----
PHP
2020/9/7

mac
prime_bench$ php --version
PHP 7.1.33 (cli) (built: Jan 26 2020 22:52:32) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2018 Zend Technologies

prime_bench$ time php prime_bench.php 1000000 1000
prime count = 78498

real	4m45.781s
user	4m34.646s
sys	0m9.808s

285.781

----
Ruby
2020/9/7

mac
prime_bench$ ruby --version
ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]

prime_bench$ time ruby prime_bench.rb 1000000 1000
78498

real	3m9.656s
user	3m8.113s
sys	0m0.443s

189.656

----
Erlang

mac
prime_bench$ erl -version
Erlang (SMP,ASYNC_THREADS,HIPE) (BEAM) emulator version 11.0.3

prime_bench$ erl
Erlang/OTP 23 [erts-11.0.3] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Eshell V11.0.3  (abort with ^G)
1> c(bench).
{ok,bench}
2> c(bench).
{ok,bench}
3> bench:bench([1]).
9602
ok

prime_bench$ erlc bench.erl

prime_bench$ time erl -noshell -run bench bench -s init stop
78518

real	277m29.096s
user	156m17.388s
sys	124m16.665s
7576.665

----
Go
2020/9/9

mac
prime_bench$ go version
go version go1.13.6 darwin/amd64

prime_bench$ time go run prime_bench.go 1000000 1000
prime count = 78498

real	0m5.550s
user	0m6.076s
sys	0m0.491s

prime_bench$ go build -o prime_benchgo prime_bench.go

prime_bench$ time ./prime_benchgo 1000000 1000
prime count = 78498

real	0m5.245s
user	0m5.819s
sys	0m0.342s

----
Perl
2020/9/9

mac
prime_bench$ perl --version

This is perl 5, version 18, subversion 4 (v5.18.4) built for darwin-thread-multi-2level
(with 2 registered patches, see perl -V for more detail)

Copyright 1987-2013, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

prime_bench$ time perl prime_bench.pl 1000000 1000
prime count = 78498

real	9m12.548s
user	8m31.669s
sys	0m3.187s
500.604

----
MacBook Pro
Intel(R) Core(TM) i5-7360U 2.30 GHz-3.60 GHz 2 Cores 4 Threads
Cinebench 15 64-bit single-core 143
Mouse Computer
Intel(R) Core(TM) i7-8750H 2.20 GHz-4.10 GHz 6 Cores 12 Threads
Cinebench 15 64-bit single-core 173

C
8.580	mac clang-1100.0.33.17
3.491	mac clang -O3
3.124	mac clang -O3 bit array
4.286	win Visual C++ 2019   00435-60000-00000-AA302 Microsoft Visual Studio Community 2019 16.4.2
3.491	win Visual C++ /O2 /Ob2 /Oi /Ot /Oy /GT /GL
asm
3.326	mac gcc
3.318	mac gcc VMX2(256bit) popcnt
3.333	mac gcc VMX2(256bit) vpaddb,vpmaddubsw,vphaddw
3.760	win Microsoft (R) Macro Assembler (x64) Version 14.24.28314.0
3.460	win VMX2(256bit) popcnt
3.485	win VMX2(256bit) vpaddb,vpmaddubsw,vphaddw
Java
4.913	mac javac 13.0.2 java 13.0.2 2020-01-14
6.315	win javac 14.0.2 java 14.0.2 2020-07-14
C#
5.325	mac Visual Studio Community 2019 for Mac Version 8.6.3 (build 30) Mono 6.10.0.104 (2019-12/5d03a6fe116) (64-bit)
9.628	mac Mono JIT compiler version 6.10.0.104 (2019-12/5d03a6fe116 Wed Apr 29 20:51:09 EDT 2020)
6.027	win C# ツール   3.4.1-beta4-19610-02+c4e5d138903b899477649a17f197abd2bcb22f9e Microsoft Visual Studio Community 2019 16.4.2 Microsoft .NET Framework 4.8.03752
Go
5.550	go version go1.13.6 darwin/amd64
5.245	go build
Perl
500.604	This is perl 5, version 18, subversion 4 (v5.18.4) built for darwin-thread-multi-2level
PHP
285.781	PHP 7.1.33 (cli) (built: Jan 26 2020 22:52:32) ( NTS )
Python
191.256	Python 2.7.16
192.255	py_compile
26.918	PyPy 7.3.1 with GCC 4.2.1 Compatible Apple LLVM 11.0.0 (clang-1100.0.33.17)
Ruby
189.656	ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]
Erlang
7576.665	Erlang (SMP,ASYNC_THREADS,HIPE) (BEAM) emulator version 11.0.3
JavaScript
9.884	mac chrome 85.0.4183.83 64 ビット
10.573	mac safari 13.1.2
17.362	mac node 14.8.0
10.122	win Chrome 84.0.4147.12
9.480	win Microsoft Edge 85.0.564.44 64 ビット
```
