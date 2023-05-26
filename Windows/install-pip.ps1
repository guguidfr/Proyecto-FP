# Comprobar si el usuario tiene privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "Este script requiere privilegios de administrador. Ejecute PowerShell como administrador e intente nuevamente."
    Read-Host "Pulsa ENTER para salir..."
    Exit 1
}

# URL de descarga del script de instalación de get-pip.py
$downloadUrl = "https://bootstrap.pypa.io/get-pip.py"

# Ruta de destino para el script de instalación de get-pip.py
$destinationPath = "$env:TEMP\get-pip.py"

# Descargar el script de instalación de get-pip.py
Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath

# Ejecutar el script de instalación de get-pip.py
Start-Process -FilePath "python" -ArgumentList $destinationPath -Wait

# Comprobar la versión instalada de pip
$pipVersion = pip --version
Write-Host "Versión de pip instalada: $pipVersion"
