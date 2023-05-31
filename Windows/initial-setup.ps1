# Comprobar si el usuario tiene privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "This script needs to be executed with administrator privileges."
    Read-Host "Press ENTER to exit..."
    Exit 1
}

# Instalar Chocolatey
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Set-ExecutionPolicy Restricted -Scope Process -Force
}

# Instalar VirtualBox
Write-Host "Installing VirtualBox..."
choco install virtualbox -y

# Instalar Visual Studio Code (VSCode)
Write-Host "Installing Visual Studio Code (VSCode)..."
choco install vscode -y

# Instalar Git
Write-Host "Installing Git..."
choco install git -y

# Instalar Python
Write-Host "Installing the latest Python version available..."
choco install python -y

# Instalar Putty y PuttyGen
Write-Host "Installing Putty..."
choco install putty.install -y

# Instalar Vagrant
Write-Host "Installing Vagrant..."
choco install vagrant -y

Write-Host "The installation process endend."
Write-Host "In case of an error during the process, try executing this script again."
# -----------------------------------------------------------------------
Write-Host "Windows needs to restart to apply changes."
Write-Host "The system will reboot in 10 seconds - Press Ctrl+C to cancel."
Start-Sleep 10
Restart-Computer
