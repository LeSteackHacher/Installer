param($Drive)

Write-Host "AquiESTEBAN : Installation de PG Admin"

# Chemin vers l'installateur de PG Admin
$cheminInstallateur = "${Drive}:\Installer\Livrable\pgadmin.exe"

# Installation de PG Admin
Start-Process -FilePath $cheminInstallateur -ArgumentList "/SILENT /NORESTART /ALLUSERS" -Wait

Write-Host "AquiESTEBAN : PG Admin est installé"