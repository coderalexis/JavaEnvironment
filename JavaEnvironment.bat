@echo off
setlocal enabledelayedexpansion

echo.
echo Seleccione una version de Java:
echo ===============================
echo 1. Java 8 (última versión)
echo 2. Java 11 (última versión)
echo 3. Java 17
echo 4. Salir
echo.

set /p choice=Ingrese una opcion (1/2/3/4): 
if "%choice%"=="1" goto java8
if "%choice%"=="2" goto java11
if "%choice%"=="3" goto java17
if "%choice%"=="4" exit
echo Opcion no valida
pause
exit

:java8
set "latestJava8Version=000"
set "latestJava8Path="

for /f "delims=" %%d in ('dir /b /ad "C:\Program Files\Java\jdk1.8.0_*"') do (
    set "currentVersion=%%~nxd"
    set "currentVersion=!currentVersion:~-3!"
    if !currentVersion! gtr !latestJava8Version! (
        set "latestJava8Version=!currentVersion!"
        set "latestJava8Path=C:\Program Files\Java\%%d"
    )
)

if not "!latestJava8Path!"=="" (
    echo Cambiando JAVA_HOME a !latestJava8Path!...
    setx JAVA_HOME "!latestJava8Path!" /M
    echo Cambio completado a Java 8.
    echo JAVA_HOME configurado es:
    echo !latestJava8Path!
) else (
    echo No se encontró una instalación de Java 8.
)
pause
exit

:java11
set "latestJava11Version=000"
set "latestJava11Path="

for /f "delims=" %%d in ('dir /b /ad "C:\Program Files\Java\jdk-11.0.*"') do (
    set "currentVersion=%%~nxd"
    set "currentVersion=!currentVersion:~-2!"
    if !currentVersion! gtr !latestJava11Version! (
        set "latestJava11Version=!currentVersion!"
        set "latestJava11Path=C:\Program Files\Java\%%d"
    )
)

if not "!latestJava11Path!"=="" (
    echo Cambiando JAVA_HOME a !latestJava11Path!...
    setx JAVA_HOME "!latestJava11Path!" /M
    echo Cambio completado a Java 11.
    echo JAVA_HOME configurado es:
    echo !latestJava11Path!
) else (
    echo No se encontró una instalación de Java 11.
)
pause
exit

:java17
echo Cambiando a Java 17...
setx JAVA_HOME "C:\Program Files\Java\jdk-17" /M
echo Cambio completado a Java 17.
echo JAVA_HOME configurado es:
echo C:\Program Files\Java\jdk-17
pause
exit
