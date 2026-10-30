@echo off
title Seed PharmaCare Database
color 0B
echo ======================================================================
echo    Seeding MongoDB Database with Demo Pharmacy Data
echo ======================================================================
cd /d %~dp0backend
npm run seed
echo.
pause
