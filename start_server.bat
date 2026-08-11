@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo 病棟テキストビューアを起動します...
echo このウィンドウは閉じずに開いたままにしてください。
echo.

where py >nul 2>nul
if %errorlevel%==0 (
    set PYCMD=py
) else (
    where python >nul 2>nul
    if %errorlevel%==0 (
        set PYCMD=python
    ) else (
        echo Pythonが見つかりませんでした。Pythonをインストールしてください。
        pause
        exit /b 1
    )
)

start "" http://localhost:8765/textviewer.html
%PYCMD% -m http.server 8765

pause
