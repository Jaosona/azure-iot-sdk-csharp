@REM Copyright (c) Microsoft. All rights reserved.
@REM Licensed under the MIT license. See LICENSE file in the project root for full license information.

setlocal

set build-root=%~dp0..
rem // resolve to fully qualified path
for %%i in ("%build-root%") do set build-root=%%~fi

REM -- C# Shared Assembly --
cd %build-root%\shared\build
call build.cmd
if errorlevel 1 goto :eof
cd %build-root%

REM -- C# Device SDK --
cd %build-root%\device\build
call build.cmd
if errorlevel 1 goto :eof
cd %build-root%

REM -- C# Service SDK --
cd %build-root%\service\build
call build.cmd
if errorlevel 1 goto :eof
cd %build-root%

REM -- Device Explorer --
cd %build-root%\tools\DeviceExplorer\build
call build.cmd
if errorlevel 1 goto :eof
cd %build-root%
