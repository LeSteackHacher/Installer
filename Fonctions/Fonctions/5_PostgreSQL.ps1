param($Drive, $postgres)

Write-Host "AquiESTEBAN : Installation de PostgreSQL"

# Chemin vers l'installateur PostgreSQL
$installerPath = "${Drive}:\Installer\Livrable\postgresql-16.exe"

# Répertoire de données PostgreSQL
$dataDir = "${Drive}:\Astree\Program\PostgreSQL\16\data"

# Port de la BDD
$BDDport = 5432

# Lancer l'installateur en mode silencieux avec les arguments nécessaires
Start-Process -FilePath "$installerPath" -ArgumentList "--mode unattended --unattendedmodeui minimal --serverport $BDDport --superpassword $postgres --datadir $dataDir --disable-components pgAdmin,stackbuilder" -Wait -NoNewWindow

Write-Host "AquiESTEBAN : PostgreSQL est installé"