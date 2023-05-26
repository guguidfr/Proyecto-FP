# Comprobar si el usuario tiene privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "Este script requiere privilegios de administrador. Ejecute PowerShell como administrador e intente nuevamente."
    Start-Sleep 5
    Exit 1
}

# Cambiar la política de ejecución de PowerShell a "Unrestricted"
Write-Host "Cambiando la política de ejecución de PowerShell..."
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

Write-Host "¡La política de ejecución de PowerShell se ha cambiado correctamente! Ahora puedes ejecutar scripts de terceros."
