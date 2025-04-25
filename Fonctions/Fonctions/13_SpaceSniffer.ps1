param($Drive, $date)

# Met SpaceSniffer dans le dossier Program
& "C:\Program Files\7-Zip\7z.exe" x "${Drive}:\Installer\Livrable\Spacesniffer.zip" -o"${Drive}:\Astree\Program\" -y

Write-Host "AquiESTEBAN : SpaceSniffer est installé"