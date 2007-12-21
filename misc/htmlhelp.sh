#!/bin/sh

WINEPREFIX=${WINEPREFIX:=$HOME/.wine}

test -d "$WINEPREFIX" || wineprefixcreate

# Setup the registry
wine regedit htmlhelp.reg

# Install HTML Help Workshop
wget -N 'http://go.microsoft.com/fwlink/?LinkId=14188'
wine htmlhelp.exe

# Install ITSS.DLL
cabextract -F hhupd.exe htmlhelp.exe
cabextract -F itircl.dll hhupd.exe
cabextract -F itss.dll hhupd.exe
cp -a itircl.dll "$WINEPREFIX/drive_c/windows/system32/"
cp -a itss.dll "$WINEPREFIX/drive_c/windows/system32/"
wine regsvr32 /s 'C:\WINDOWS\SYSTEM32\itircl.dll'
wine regsvr32 /s 'C:\WINDOWS\SYSTEM32\itss.dll'

# Install MFC40.DLL
wget -N http://activex.microsoft.com/controls/vc/mfc40.cab
cabextract -F mfc40.exe mfc40.cab
cabextract -F mfc40.dll mfc40.exe
cp -a mfc40.dll "$WINEPREFIX/drive_c/windows/system32/"
