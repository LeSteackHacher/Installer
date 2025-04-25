param($Drive, $date)

# Met Java dans le dossier Program
& "C:\Program Files\7-Zip\7z.exe" x "${Drive}:\Astree\Livraison\$date\Livrable\OpenJDK21U*.zip" -o"C:\Program Files\Java\" -y

#Création de la variable d'environnement
$nomVariable = "JAVA_HOME"
$valeurVariable = "C:\Program Files\Java\jdk-21.0.5+11"
[System.Environment]::SetEnvironmentVariable($nomVariable, $valeurVariable, [System.EnvironmentVariableTarget]::Machine)

Write-Host "AquiESTEBAN : Variable d'environnement système JAVA_HOME créée avec succès"

# Ajout de la variable au PATH
$NewPath = "%JAVA_HOME%\bin"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";" + $NewPath, [System.EnvironmentVariableTarget]::Machine)

Write-Host "AquiESTEBAN : JAVA_HOME ajouté au PATH"
Write-Host "AquiESTEBAN : Java est bien installé"

# Ajout PostgreSQL aux variables système
$pgsqlPath = "C:\Program Files\PostgreSQL\16\bin"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";" + $pgsqlPath, [System.EnvironmentVariableTarget]::Machine)

Write-Host "AquiESTEBAN : PostgreSQL ajouté au PATH"