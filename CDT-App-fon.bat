@echo off

cd C:\EJB\mariadb-10.11.4-winx64\bin
start "" /min /b mysqld.exe --console

timeout /t 2 /nobreak

cd C:\EJB\wildfly-17.0.1.Final\bin\
start "" /min /b standalone.bat
exit