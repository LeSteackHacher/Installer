param($Drive, $postgres, $date)

Write-Host "AquiESTEBAN : Création des utilisateurs BDD et restauration de la BDD"

# Variable de la configuration de la BDD
$bddhost = "localhost"
$port = "5432"
$dbName = "aquiweb"
$adminUser = "postgres"
$adminPassword = $postgres
$newPassword = "password"
$backupFile = "${Drive}:\Astree\Livraison\$date\Livrable\aquiweb_defaut_7.0.backup"
$env:PGPASSWORD = $adminPassword

######################
# Création de la BDD #
######################
psql -h $bddhost -p $port -U $adminUser -d postgres -c "CREATE DATABASE $dbName;"

Write-Host "AquiESTEBAN : Base de donnée $dbName créée"

#############################
# Création des utilisateurs #
#############################
# aquiweb_ro
$newUser = "aquiweb_ro"
$newPasswordSecu = Read-Host "AquiESTEBAN : Entrez le mot de passe aquiweb_ro " -AsSecureString
$newPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($newPasswordSecu)
)

$command = "CREATE USER $newUser WITH LOGIN PASSWORD '$newPassword'; GRANT CONNECT ON DATABASE $dbName TO $newUser;"
psql -h $bddhost -p $port -U $adminUser -d $dbName -c "$command"

Write-Host "AquiESTEBAN : Utilisateur $newUser créé"

# aquiweb_rw
$newUser = "aquiweb_rw"
$newPasswordSecu = Read-Host "AquiESTEBAN : Entrez le mot de passe aquiweb_rw " -AsSecureString
$newPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($newPasswordSecu)
)

$command = "CREATE USER $newUser WITH LOGIN PASSWORD '$newPassword'; GRANT CONNECT ON DATABASE $dbName TO $newUser;"
psql -h $bddhost -p $port -U $adminUser -d $dbName -c "$command"

Write-Host "AquiESTEBAN : Utilisateur $newUser créé"

# client_ro
$newUser = Read-Host "AquiESTEBAN : Entrez le nom d'utilisateur client_ro "
$newPasswordSecu = Read-Host "AquiESTEBAN : Entrez le mot de passe client_ro " -AsSecureString
$newPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($newPasswordSecu)
)

$command = "CREATE USER $newUser WITH LOGIN PASSWORD '$newPassword'; GRANT CONNECT ON DATABASE $dbName TO $newUser;"
psql -h $bddhost -p $port -U $adminUser -d $dbName -c "$command"

Write-Host "AquiESTEBAN : Utilisateur $newUser créé"

##########################
# Restauration de la BDD #
##########################
pg_restore -h $bddhost -p $port -U $adminUser -d $dbName --clean --if-exists --verbose $backupFile

Write-Host "AquiESTEBAN : Restauration de la BDD terminée"