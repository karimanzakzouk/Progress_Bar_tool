@ECHO OFF

setlocal EnableDelayedExpansion
set x=1
Set progress_file="progress.txt"


IF NOT EXIST %progress_file% (

ECHO !x! > %progress_file%

)


FOR /F "tokens=1" %%a IN (progress.txt) DO (

set /a x=%%a+1
ECHO !x! > %progress_file%

)


exit 0