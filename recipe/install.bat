@echo on

mkdir %SCRIPTS%

copy prog\udunits2.exe %SCRIPTS%\udunits2.exe || exit 1
copy lib\udunits2.dll %SCRIPTS%\udunits2.dll || exit 1
copy ..\lib\*.h %LIBRARY_INC%\ || exit 1
copy lib\*.exp %LIBRARY_LIB%\ || exit 1
copy lib\*.lib %LIBRARY_LIB%\ || exit 1

set ACTIVATE_DIR=%PREFIX%\etc\conda\activate.d
set DEACTIVATE_DIR=%PREFIX%\etc\conda\deactivate.d
mkdir %ACTIVATE_DIR%
mkdir %DEACTIVATE_DIR%

copy %RECIPE_DIR%\scripts\activate.bat %ACTIVATE_DIR%\udunits2-activate.bat || exit 1
copy %RECIPE_DIR%\scripts\deactivate.bat %DEACTIVATE_DIR%\udunits2-deactivate.bat  || exit 1

:: Copy unix shell activation scripts, needed by Windows Bash users
copy %RECIPE_DIR%\scripts\activate.sh %ACTIVATE_DIR%\udunits2-activate.sh || exit 1
copy %RECIPE_DIR%\scripts\deactivate.sh %DEACTIVATE_DIR%\udunits2-deactivate.sh || exit 1
