@echo off
echo "This .bat file uninstalls the OpenSSH Client of Windows."
echo "If you want to proceed, press ENTER; use Ctrl+C to exit this script."
rem Remember that if you don't remove OpenSSH, you will need to pass your ssh public key to the Vagrant VM.
pause >nul
dism /online /Remove-Capability /CapabilityName:OpenSSH.Client~~~~0.0.1.0
