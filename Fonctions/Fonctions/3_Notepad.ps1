param($Drive)

Write-Host "AquiESTEBAN : Installation de Notepad ++"

# Chemin vers l'installateur de Notepad ++
$cheminInstallateur = "${Drive}:\Installer\Livrable\np++.exe"

# Installation de Notepad ++
Start-Process -FilePath $cheminInstallateur -ArgumentList "/S" -Wait

Write-Host "AquiESTEBAN : Notepad ++ est installé"