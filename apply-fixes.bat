@echo off
echo === 1/4 Reset the 3 files to the original state ===
git checkout b0fb7d9 -- src/shared/packet-serializer.hpp src/client/core/system/resource_manager.cpp src/client/core/ui/download_dialog.cpp
if errorlevel 1 goto fail
echo === 2/4 Apply fixes ===
git apply --ignore-whitespace all-fixes.patch
if errorlevel 1 goto fail
echo === 3/4 Commit ===
git add -A
git commit -m "Security fixes + vcpkg CMake fix"
echo === 4/4 Push ===
git push
if errorlevel 1 goto fail
echo.
echo DONE. Now open GitHub - Actions - Create Release - Run workflow - version 1.4.3
pause
exit /b 0
:fail
echo.
echo ERROR. Send me the text above.
pause
exit /b 1
