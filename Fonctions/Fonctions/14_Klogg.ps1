param($Drive, $date)

Write-Host "AquiESTEBAN : Installation de Klogg"

# Chemin vers l'installateur de Klogg
$cheminInstallateur = "${Drive}:\Installer\Livrable\klogg.exe"

# Installation de Klogg
Start-Process -FilePath $cheminInstallateur -ArgumentList "/S" -Wait

Write-Host "AquiESTEBAN : Klogg est installé"

Pause