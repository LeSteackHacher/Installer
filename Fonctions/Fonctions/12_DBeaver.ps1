param($Drive, $date)

Write-Host "AquiESTEBAN : Installation de DBeaver"

# Chemin vers l'installateur de DBeaver
$cheminInstallateur = "${Drive}:\Installer\Livrable\dbeaver.exe"

# Installation de DBeaver
Start-Process -FilePath $cheminInstallateur -ArgumentList "/allusers /S" -Wait

Write-Host "AquiESTEBAN : DBeaver est installé"

# Dezippe dans Livrable les drivers de DBeaver
& "C:\Program Files\7-Zip\7z.exe" x "${Drive}:\Installer\Livrable\DriverDBeaver.zip" -o"${Drive}:\Installer\Livrable\" -y

$destFolder = "$env:APPDATA\DBeaverData"
$sourceFolder = "${Drive}:\Installer\Livrable\DriverDBeaver"

# Copier le fichier
Copy-Item -Path "$sourceFolder\*" -Destination $destFolder -Recurse -Force

Write-Host "AquiESTEBAN : Les drivers de DBeaver ont été mis en place"
Write-Host "AquiESTEBAN : DBeaver est prêt à être utilisé"