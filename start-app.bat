@echo off
title Launch PharmaCare Pro System
color 0A
echo ======================================================================
echo    PHARMACARE PRO - PHARMACY MANAGEMENT & POS BILLING SYSTEM
echo    University of Mumbai - T.Y. B.Sc. Computer Science (NEP 2020)
echo    Student: Ritika Sharma (Roll No: 23) ^| Guide: Prof. Jayshree Patade
echo ======================================================================
echo.
echo [1/3] Starting Backend API Server (Port 5000)...
start "PharmaCare Backend Server" cmd /k "cd /d %~dp0backend && npm run dev"

echo [2/3] Waiting for backend initialization...
timeout /t 3 /nobreak > nul

echo [3/3] Starting Frontend React Application (Port 3000)...
start "PharmaCare Frontend React" cmd /k "cd /d %~dp0frontend && npm run dev"

timeout /t 3 /nobreak > nul
echo.
echo Opening Web Portal in Default Browser...
start http://localhost:3000

echo.
echo ======================================================================
echo  System is running!
echo  - Frontend UI:  http://localhost:3000
echo  - Backend API:  http://localhost:5000
echo.
echo  Demo Credentials:
echo    Admin:      admin@pharmacy.com      / admin123
echo    Pharmacist: pharmacist@pharmacy.com / pharma123
echo    Cashier:    cashier@pharmacy.com    / cash123
echo ======================================================================
pause
