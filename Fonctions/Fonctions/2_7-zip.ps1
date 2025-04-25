param($Drive)

Write-Host "AquiESTEBAN : Installation de 7-Zip"

# Chemin vers l'installateur de 7-Zip
$cheminInstallateur = "${Drive}:\Installer\Livrable\7-zip.exe"

# Installation de 7-zip
Start-Process -FilePath $cheminInstallateur -ArgumentList "/S" -Wait

Write-Host "AquiESTEBAN : 7-Zip est installé"