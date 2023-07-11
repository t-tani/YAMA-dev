@REM update yara resource file

python utils\arc4.py -f .\rsrc\ioc\rule.yara

@REM update project
cd build
cmake -DCMAKE_C_COMPILER="C:/Program Files/LLVM/bin/clang.exe" ^
      -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang++.exe" ^
      -DCMAKE_RC_COMPILER="C:/Program Files/LLVM/bin/llvm-rc.exe" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -G Ninja ..

@REM update resource object
ninja -t clean CMakeFiles/Yama.dir/rsrc/resources.rc.res > yama-ninja.log
ninja -v CMakeFiles/Yama.dir/rsrc/resources.rc.res >> yama-ninja.log

@REM build YAMA scanner
dir /s /b
ninja >> yama-ninja.log
cd ..\