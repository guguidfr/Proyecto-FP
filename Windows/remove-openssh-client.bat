@echo off
echo "Este .bat file desinstala el cliente de OpenSSH de Windows."
echo "Si quieres continuar, pula ENTER, en caso contrario usa Ctrl+C."
rem Recuerda que si no desinstalas OpenSSH, necesitarás pasar tu clave pública a la máquina virtual de Vagrant.
pause >nul
dism /online /Remove-Capability /CapabilityName:OpenSSH.Client~~~~0.0.1.0
