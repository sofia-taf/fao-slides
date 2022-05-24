@echo off

md c:\home\latex\sty\fao
xcopy sty c:\home\latex\sty\fao /s /y
setx TEXINPUTS .//;c:/home/latex//;

echo Installation completed
pause
