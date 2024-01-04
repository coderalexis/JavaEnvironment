@echo off
setlocal enabledelayedexpansion

echo.
echo Seleccione una version de Java:
echo ===============================
echo 1. Java 8
echo 2. Java 11
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
echo Cambiando a Java 8...
setx JAVA_HOME "C:\Program Files\Java\jdk-1.8" /M
echo Cambio completado a Java 8.
echo JAVA_HOME configurado es:
echo C:\Program Files\Java\jdk-8
pause
exit

:java11
echo Cambiando a Java 11...
setx JAVA_HOME "C:\Program Files\Java\jdk-11" /M
echo Cambio completado a Java 11.
echo JAVA_HOME configurado es:
echo C:\Program Files\Java\jdk-11
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
