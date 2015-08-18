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
FOR /F "tokens=* " %%i IN (%CItest%\CItest-res\JenkinsCI.txt) DO cmd /c %%i

REM login to spoon
spoon login CItest C1t3stp4s5

REM Loop through all the spoon.me files, build the app and check the result
FOR /F %%i IN (spoonme-files.txt) do (
spoon build --no-base --overwrite %%i

REM TODO: Catch the result of 'spoon build' command.
REM echo Exit code for %%i is %ERRORLEVEL% > test-results.txt 
)

spoon images > images-created.txt