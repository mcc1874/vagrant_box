@echo off
set /p "input=reset hosts (input 1):"
if %input% == 1 (
	echo. >> C:\\Windows\\System32\\drivers\\etc\\hosts
	echo # 本地 >> C:\\Windows\\System32\\drivers\\etc\\hosts
	echo 127.0.0.1 www.test.com >> C:\\Windows\\System32\\drivers\\etc\\hosts
) 
pause