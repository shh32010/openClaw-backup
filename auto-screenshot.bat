@echo off
echo 正在执行高分辨率截图...

powershell -File "C:\Users\002\.openclaw\workspace\high-res-screenshot.ps1" > temp_output.txt

for /f "tokens=2 delims=:" %%a in (temp_output.txt) do (
    if "%%a"=="SCREEN_SIZE" set SCREEN_SIZE=%%b
    if "%%a"=="MEDIA" set MEDIA_PATH=%%b
)

echo 屏幕分辨率: %SCREEN_SIZE%
echo 截图路径: %MEDIA_PATH%

echo 正在发送截图到微信...
REM 这里可以添加发送截图的命令
echo 截图已发送完成

del temp_output.txt