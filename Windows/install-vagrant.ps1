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

# Descargar el archivo ejecutable de Vagrant
Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath

# Ejecutar el archivo de instalación de Vagrant
Start-Process -FilePath $destinationPath -ArgumentList "/S" -Wait

# Comprobar la versión instalada de Vagrant
$vagrantVersion = vagrant --version
Write-Host "Versión de Vagrant instalada: $vagrantVersion"
