@echo off
echo This .bat file uninstalls the OpenSSH Client of Windows.
dism /online /Remove-Capability /CapabilityName:OpenSSH.Client~~~~0.0.1.0
