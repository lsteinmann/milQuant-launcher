@echo off
echo Installing milQuant Launcher...

set INSTALL_DIR=%APPDATA%\milQuant
mkdir "%INSTALL_DIR%" 2>nul

copy /y "%~dp0milQuant.bat" "%INSTALL_DIR%\milQuant.bat" >nul
copy /y "%~dp0milQuant_launcher.R" "%INSTALL_DIR%\milQuant_launcher.R" >nul
copy /y "%~dp0quant-icon.ico" "%INSTALL_DIR%\quant-icon.ico" >nul

echo Creating desktop shortcut...
powershell -NoProfile -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\milQuant.lnk');$s.TargetPath='%INSTALL_DIR%\milQuant.bat';$s.WorkingDirectory='%INSTALL_DIR%';$s.IconLocation='%INSTALL_DIR%\quant-icon.ico';$s.Description='Start milQuant';$s.Save()"

echo Done! You can now start milQuant from the shortcut on your desktop.
pause
