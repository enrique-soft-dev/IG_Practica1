echo off
cd C:\Users\mario\OneDrive\University\Cuarto\Conocimiento\Practica\

set no_prueba=1
setlocal
for %%i in (runs\*) do (
    call echo ============ PRUEBA %%no_prueba%% ============
    "C:\Program Files\CLIPS 6.4\CLIPSDOS.exe" -f %cd%\%%i
    echo ==================================
    echo:
    echo:
    echo:
    echo:
    set /a no_prueba+=1
)

pause