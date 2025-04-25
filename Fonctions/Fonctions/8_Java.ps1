param($Drive, $date)

# Met Java dans le dossier Program
& "C:\Program Files\7-Zip\7z.exe" x "${Drive}:\Astree\Livraison\$date\Livrable\OpenJDK21U*.zip" -o"C:\Program Files\Java\" -y

#Création de la variable d'environnement
$nomVariable = "JAVA_HOME"
$valeurVariable = "C:\Program Files\Java\jdk-21.0.5+11"
[System.Environment]::SetEnvironmentVariable($nomVariable, $valeurVariable, [System.EnvironmentVariableTarget]::Machine)

Write-Host "AquiESTEBAN : Variable d'environnement système JAVA_HOME créée avec succès"

$javaBin = "%JAVA_HOME%\bin"

# Lire le PATH système actuel
$machinePath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")

# Vérifie si le chemin est déjà présent
if ($machinePath -notlike "*$javaBin*") {
    $newMachinePath = "$machinePath;$javaBin"
    [System.Environment]::SetEnvironmentVariable("Path", $newMachinePath, "Machine")
    Write-Host "`n✅ %JAVA_HOME%\bin a été ajouté au PATH système."
} else {
    Write-Host "`nℹ️ %JAVA_HOME%\bin est déjà dans le PATH système."
}

Write-Host "AquiESTEBAN : JAVA_HOME ajouté au PATH"
Write-Host "AquiESTEBAN : Java est bien installé"

$env:PATH += ";C:\Program Files\PostgreSQL\16\bin"

Write-Host "AquiESTEBAN : PostgreSQL ajouté au PATH pour la session locale"