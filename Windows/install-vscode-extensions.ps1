Write-Host "The recommended VSCode extensions will be installed."
Read-Host "Press ENTER to continue..."
# Lista de extensiones de VSCode a instalar
$extensions = @(
    "bbenoist.vagrant",
    "marcostazi.VS-code-vagrantfile",
    "ms-python.python",
    "oderwat.indent-rainbow"
)

# Instalar extensiones de VSCode
Write-Host "Installing extensions..."
foreach ($extension in $extensions) {
    Write-Host "Installing: $extension..."
    code --install-extension $extension
}

Write-Host "The installation process endend."
Write-Host "In case of an error during the process, try executing this script again."
Read-Host "Press ENTER to exit..."
