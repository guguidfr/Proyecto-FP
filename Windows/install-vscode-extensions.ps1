Write-Host "Se instalarán las extensiones de VSCode recomendadas para el entorno de desarrollo."
Read-Host "Pulsa ENTER para continuar..."
# Lista de extensiones de VSCode a instalar
$extensions = @(
    "bbenoist.vagrant",
    "marcostazi.VS-code-vagrantfile",
    "ms-python.python",
    "oderwat.indent-rainbow"
)

# Instalar extensiones de VSCode
Write-Host "Instalando extensiones de VSCode..."
foreach ($extension in $extensions) {
    Write-Host "Instalando extensión $extension..."
    code --install-extension $extension
}

Write-Host "El proceso de instalación ha terminado."
Read-Host "Pulsa ENTER para salir..."
