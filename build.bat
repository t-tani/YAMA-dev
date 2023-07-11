@REM Encrypt yara rule to avoid unncessary security alerts.

python utils\arc4.py -f .\rsrc\ioc\rule.yara

@REM Initialize build derectory

mkdir build
cd .\build
echo y | del *

@REM Build YAMA Scanner

cmake -DCMAKE_C_COMPILER="C:/Program Files/LLVM/bin/clang.exe" ^
      -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang++.exe" ^
      -DCMAKE_RC_COMPILER="C:/Program Files/LLVM/bin/llvm-rc.exe" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -G Ninja .. > yama-cmake.log
ninja -v > yama-ninja.log
cd ..\
