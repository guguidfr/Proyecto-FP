# Comprobar si el usuario tiene privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "Este script requiere privilegios de administrador. Ejecute PowerShell como administrador e intente nuevamente."
    Read-Host "Pulsa ENTER para salir..."
    Exit 1
}

# URL de descarga de la última versión de Vagrant
$downloadUrl = "https://releases.hashicorp.com/vagrant/2.3.6/vagrant_2.3.6_windows_amd64.msi"

# Ruta de destino para el archivo ejecutable de Vagrant
$destinationPath = "$env:TEMP\vagrant_2.3.6_windows_amd64.msi"

Write-Host "La instalación de Vagrant es obligatoria para trabajar en el proyecto."
Write-Host "Si quieres instalarlo de manera automática con este scriot, debes esperar a que el program reciba los 260.000.000 de bytes (estimados) del paquete de instalación de Vagrant."
Read-Host "Si quieres continuar con la instalación automática, pulsa ENTER. En caso contrario, pulsa Ctrl+C para detenerlo."
# Descargar el archivo ejecutable de Vagrant
Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath

# Ejecutar el archivo de instalación de Vagrant
Start-Process -FilePath $destinationPath -ArgumentList "/S" -Wait

# Comprobar la versión instalada de Vagrant
$vagrantVersion = vagrant --version
Write-Host "Versión de Vagrant instalada: $vagrantVersion"
Write-Host "The installation process endend."
Write-Host "In case of an error during the process, try executing this script again."
Read-Host "Press ENTER to exit..."

