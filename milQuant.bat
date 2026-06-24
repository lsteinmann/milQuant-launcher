@echo off
set RSCRIPT="C:\Users\_ADD_USER_\AppData\Local\Programs\R\_ADD_VERSION_\bin\Rscript.exe"
set RSCRIPT_FILE="%~dp0milQuant_launcher.R"
%RSCRIPT% %RSCRIPT_FILE%
pause