param($Drive, $date)

# Copier le fichier
Copy-Item -Path ${Drive}:\Installer\Livrable* -Destination ${Drive}:\Astree\Livraison\$date\ -Recurse -Force

Write-Host "AquiESTEBAN : Livrable déplacé dans le dossier de livraison"

# Boucles pour chopper le premier fichier avec le bon debut de nom et le dezippe dans le bon fichier
# Dezipage d'Acquisition
foreach ($file in Get-ChildItem -Path "${Drive}:\Astree\Livraison\$date\Livrable\" -Filter "acquisition-7*.zip") {
    & "C:\Program Files\7-Zip\7z.exe" x "$($file.FullName)" -o"${Drive}:\Astree\aquiweb\" -y
}

# Dezipage d'Aquiweb
foreach ($file in Get-ChildItem -Path "${Drive}:\Astree\Livraison\$date\Livrable\" -Filter "aquiweb-7*.zip") {
    & "C:\Program Files\7-Zip\7z.exe" x "$($file.FullName)" -o"${Drive}:\Astree\aquiweb\" -y
}

# Dezipage d'OIDC Server
foreach ($file in Get-ChildItem -Path "${Drive}:\Astree\Livraison\$date\Livrable\" -Filter "oidc-server-7*.zip") {
    & "C:\Program Files\7-Zip\7z.exe" x "$($file.FullName)" -o"${Drive}:\Astree\aquiweb\" -y
}

# Dezipage de Plant-Data
foreach ($file in Get-ChildItem -Path "${Drive}:\Astree\Livraison\$date\Livrable\" -Filter "ui-7*.zip") {
    & "C:\Program Files\7-Zip\7z.exe" x "$($file.FullName)" -o"${Drive}:\Astree\aquiweb\" -y
}

# Dezipage d'ui
foreach ($file in Get-ChildItem -Path "${Drive}:\Astree\Livraison\$date\Livrable\" -Filter "plantdata-7*.zip") {
    & "C:\Program Files\7-Zip\7z.exe" x "$($file.FullName)" -o"${Drive}:\Astree\aquiweb\" -y
}

# Dezipage du fichier Support
& "C:\Program Files\7-Zip\7z.exe" x "${Drive}:\Astree\Livraison\$date\Livrable\Support.zip" -o"${Drive}:\Astree\aquiweb\" -y

# Copier le fichier
Copy-Item -Path ${Drive}:\Astree\Livraison\$date\Livrable\id_rsa* -Destination ${Drive}:\Astree\rsa\ -Recurse -Force

Write-Host "AquiESTEBAN : Les fichiers d'installation ont été dézippé dans les bons dossiers"

# Renommer le dossier d'Acquisition
Get-ChildItem -Path "${Drive}:\Astree\aquiweb\acquisition-7*" | ForEach-Object {
    Rename-Item -Path $_.FullName -NewName "acquisition"
}

# Renommer le dossier d'Aquiweb
Get-ChildItem -Path "${Drive}:\Astree\aquiweb\aquiweb-7*" | ForEach-Object {
    Rename-Item -Path $_.FullName -NewName "aquiweb"
}

# Renommer le dossier d'OIDC Server
Get-ChildItem -Path "${Drive}:\Astree\aquiweb\oidc-server-7*" | ForEach-Object {
    Rename-Item -Path $_.FullName -NewName "oidcServer"
}

# Renommer le dossier de Plant-Data
Get-ChildItem -Path "${Drive}:\Astree\aquiweb\plantdata-7*" | ForEach-Object {
    Rename-Item -Path $_.FullName -NewName "plantdata"
}

# Renommer le dossier d'ui
Get-ChildItem -Path "${Drive}:\Astree\aquiweb\ui-7*" | ForEach-Object {
    Rename-Item -Path $_.FullName -NewName "ui"
}

# Pas de renommage de Support puisqu'il a direct le bon nom
Write-Host "AquiESTEBAN : Les dossiers de services Aquiweb ont bien été renommés"