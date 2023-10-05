:: Needed so we can find expat.h from expat.
set LIB=%LIBRARY_LIB%;.\lib;%LIB%
set LIBPATH=%LIBRARY_LIB%;.\lib;%LIBPATH%
set INCLUDE=%LIBRARY_INC%;%INCLUDE%

copy %RECIPE_DIR%\unistd.h %SRC_DIR% || exit 1

mkdir build
cd build
cmake -G "NMake Makefiles" ^
      -D EXPAT_INCLUDE_DIR=%LIBRARY_INC%\expat.h ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_BUILD_TYPE=Release ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake libudunits2 || exit 1
nmake udunits2 || exit 1
