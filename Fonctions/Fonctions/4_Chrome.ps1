param($Drive)

Write-Host "AquiESTEBAN : Installation de Google Chrome"

# Chemin vers l'installateur de Google Chrome
$cheminInstallateur = "${Drive}:\Installer\Livrable\Chrome.exe"

# Installation de Google Chrome
Start-Process -FilePath $cheminInstallateur -ArgumentList "/S" -Wait

Write-Host "AquiESTEBAN : Google Chrome est installé"