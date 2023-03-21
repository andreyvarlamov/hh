@echo off

set CompilerFlags=-MT -nologo -Gm- -GR- -EHa- -Od -Oi -WX -W4 -wd4201 -wd4100 -wd4189 -DHANDMADE_INTERNAL=1 -DHANDMADE_SLOW=1 -FC -Z7
set LinkerFlags=-incremental:no -opt:ref
set LinkLibs=user32.lib Gdi32.lib winmm.lib

IF NOT EXIST ..\build mkdir ..\build
pushd ..\build

REM 32-bit build (Target Windows XP - 5.1)
REM cl %CompilerFlags% ..\code\win32_handmade.cpp /link -subsystem:windows,5.1 %LinkerFlags% %LinkLibs%

REM 64-bit build (Target Windows Vista - 6.0, default)
cl %CompilerFlags% ..\code\handmade.cpp -Fmhandmade.map /LD /link /EXPORT:GameGetSoundSamples /EXPORT:GameUpdateAndRender %LinkerFlags%
cl %CompilerFlags% ..\code\win32_handmade.cpp -Fmwin32_handmade.map /link %LinkerFlags% %LinkLibs%

popd
