@echo off
pushd "%~dp0"
if errorlevel 1 exit /b %errorlevel%

cargo build --release --locked
if errorlevel 1 (
    set "exit_code=%errorlevel%"
    popd
    exit /b %exit_code%
)

cargo test --locked
set "exit_code=%errorlevel%"
popd
exit /b %exit_code%
