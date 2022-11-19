echo off
cd C:\Users\mario\OneDrive\University\Cuarto\Conocimiento\Practica\

setlocal
for %%i in (runs\*) do (
    call echo ============ %%i ============
    "C:\Program Files\CLIPS 6.4\CLIPSDOS.exe" -f %cd%\%%i
    echo ==================================
    echo:
    echo:
    echo:
    echo:
)

pause