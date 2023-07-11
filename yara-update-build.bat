@REM update yara resource file

python utils\arc4.py -f .\rsrc\ioc\rule.yara

@REM update resource object

cd build
ninja -t clean CMakeFiles/Yama.dir/rsrc/resources.rc.res > yama-ninja.log
ninja -v CMakeFiles/Yama.dir/rsrc/resources.rc.res >> yama-ninja.log

@REM build YAMA scanner
dir /s /b
ninja >> yama-ninja.log
cd ..\