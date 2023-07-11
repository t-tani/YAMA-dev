@REM set ccache folder to env

set CCACHE_DIR=%CD%\.ccache

@REM update yara resource file

python utils\arc4.py -f .\rsrc\ioc\rule.yara

@REM fource update resource object
ninja -t clean CMakeFiles/Yama.dir/rsrc/resources.rc.res > yama-ninja.log
ninja -v CMakeFiles/Yama.dir/rsrc/resources.rc.res >> yama-ninja.log

@REM build YAMA scanner
dir /s /b
ninja >> yama-ninja.log
cd ..\