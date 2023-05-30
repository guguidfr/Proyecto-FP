# Comprobar si el usuario tiene privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "Este script requiere privilegios de administrador. Ejecute PowerShell como administrador e intente nuevamente."
    Read-Host "Pulsa ENTER para salir..."
    Exit 1
}

# Instalar Chocolatey
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Set-ExecutionPolicy Restricted -Scope Process -Force
}

# Instalar VirtualBox
Write-Host "Instalando VirtualBox..."
choco install virtualbox -y

# Instalar Visual Studio Code (VSCode)
Write-Host "Instalando Visual Studio Code (VSCode)..."
choco install vscode -y

# Instalar Git
Write-Host "Instalando Git..."
choco install git -y

# Instalar Python
Write-Host "Instalando la última versión de Python disponible..."
choco install python -y

# # Instalar Insomnia Rest API
# Write-Host "Instalando Insomnia..."
# choco install insomnia-rest-api-client -y

# Instalar Vagrant
Write-Host "Instalando Vagrant..."
choco install vagrant -y

Write-Host "El proceso de instalación ha terminado."
Write-Host "Si ha habido algún problema durante la instalación, prueba a volver a ejecutar este script."
Read-Host "Pulsa ENTER para salir..."
