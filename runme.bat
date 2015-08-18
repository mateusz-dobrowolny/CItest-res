@echo off

REM Define working folder where the scripts will be copied
set CItest=C:\CItest

REM Prepare working folder with the content
rmdir %CItest% /s /q
mkdir %CItest%
cd /d %CItest%

REM If git is installed locally, just copy files from GitHub
git clone https://github.com/spoonapps/spoonme
git clone https://github.com/mateusz-dobrowolny/CItest-res

REM Create file with paths for the spoon.me files:
cd spoonme
FOR /F "tokens=* " %%i IN (%CItest%\CItest-res\JenkinsCI.txt) DO %%i

REM dla ka¿dej aplikacji z pliku txt wykonaj:  launch.bat`

REM przeleæ po œcie¿kach i 
REM spoon logujesz siê na konto testbuild
REM spoon build --overwrite spoon.me
