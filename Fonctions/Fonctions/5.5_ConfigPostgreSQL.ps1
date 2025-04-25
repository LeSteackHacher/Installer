param($Drive)

########################
# Modification des ACL #
########################

# Chemin du répertoire cible
$chemin = "${Drive}:\Astree\Program\PostgreSQL\16"

# Utilisateur via SID
$sid = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-20")
$utilisateur = $sid.Translate([System.Security.Principal.NTAccount])

# Vérifie si le dossier existe
if (-Not (Test-Path $chemin)) {
    Write-Error "Le dossier '$chemin' n'existe pas."
    return
}

# Récupère les ACL
try {
    $acl = Get-Acl -Path $chemin
} catch {
    Write-Error "Erreur lors de la récupération des ACL : $_"
    return
}

# Crée la règle d'accès (Contrôle total)
try {
    $droits = [System.Security.AccessControl.FileSystemRights]::FullControl
    $type = [System.Security.AccessControl.AccessControlType]::Allow
    $héritage = [System.Security.AccessControl.InheritanceFlags]"ContainerInherit, ObjectInherit"
    $propagation = [System.Security.AccessControl.PropagationFlags]::None

    $regle = New-Object System.Security.AccessControl.FileSystemAccessRule(
        $utilisateur,
        $droits,
        $héritage,
        $propagation,
        $type
    )

    $acl.AddAccessRule($regle)
    Set-Acl -Path $chemin -AclObject $acl

    Write-Host "Contrôle total accordé à NETWORK SERVICE via SID ($sid)"
} catch {
    Write-Error "Erreur lors de l'application des droits : $_"
}

######################################
# Création fichier PostgreSQL Astrée #
######################################

# Demande la capacité de RAM
$TotalMemGB = Read-Host "AquiESTEBAN : Combien de memoire RAM a l'ordinateur (en Giga)"

# Définit le chemin vers le fichier de config Astrée
$cheminFichier = "${Drive}:\Astree\Program\PostgreSQL\16\postgresql_astree.conf"

# Système de IF qui permet de remplir le fichier de configuration selon la réponse de l'utilisateur
if ($TotalMemGB -le 11) {
    Write-Host "AquiESTEBAN : Le serveur n'a pas assez de RAM, nous ne pouvons pas configurer le fichier automatiquement."
}

if ($TotalMemGB -eq 12) {
    $contenuFichier = "# CONNECTIONS AND AUTHENTICATION
listen_addresses = '*'
port = 5432

# REPORTING AND LOGGING
log_directory = '../log'
lc_messages = 'en_US'

# DB Version: 16
# OS Type: windows
# DB Type: mixed
# Total Memory (RAM): 12 GB
# Connections num: 250
# Data Storage: ssd

max_connections = 250
shared_buffers = 3GB
effective_cache_size = 9GB
maintenance_work_mem = 768MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
work_mem = 3145kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB

log_min_duration_statement = 700"
}

if ($TotalMemGB -eq 13) {
    $contenuFichier = "# CONNECTIONS AND AUTHENTICATION
listen_addresses = '*'
port = 5432

# REPORTING AND LOGGING
log_directory = '../log'
lc_messages = 'en_US'

# DB Version: 16
# OS Type: windows
# DB Type: mixed
# Total Memory (RAM): 13 GB
# Connections num: 250
# Data Storage: ssd

max_connections = 250
shared_buffers = 3328MB
effective_cache_size = 9984MB
maintenance_work_mem = 832MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
work_mem = 3407kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB

log_min_duration_statement = 700"
}

if ($TotalMemGB -eq 14) {
    $contenuFichier = "# CONNECTIONS AND AUTHENTICATION
listen_addresses = '*'
port = 5432

# REPORTING AND LOGGING
log_directory = '../log'
lc_messages = 'en_US'

# DB Version: 16
# OS Type: windows
# DB Type: mixed
# Total Memory (RAM): 14 GB
# Connections num: 250
# Data Storage: ssd

max_connections = 250
shared_buffers = 3584MB
effective_cache_size = 10752MB
maintenance_work_mem = 896MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
work_mem = 3670kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB

log_min_duration_statement = 700"
}

if ($TotalMemGB -eq 15) {
    $contenuFichier = "# CONNECTIONS AND AUTHENTICATION
listen_addresses = '*'
port = 5432

# REPORTING AND LOGGING
log_directory = '../log'
lc_messages = 'en_US'

# DB Version: 16
# OS Type: windows
# DB Type: mixed
# Total Memory (RAM): 15 GB
# Connections num: 250
# Data Storage: ssd

max_connections = 250
shared_buffers = 3840MB
effective_cache_size = 11520MB
maintenance_work_mem = 960MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
work_mem = 3932kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB

log_min_duration_statement = 700"
}

if ($TotalMemGB -eq 16) {
    $contenuFichier = "# CONNECTIONS AND AUTHENTICATION
listen_addresses = '*'
port = 5432

# REPORTING AND LOGGING
log_directory = '../log'
lc_messages = 'en_US'

# DB Version: 16
# OS Type: windows
# DB Type: mixed
# Total Memory (RAM): 16 GB
# Connections num: 250
# Data Storage: ssd

max_connections = 250
shared_buffers = 4GB
effective_cache_size = 12GB
maintenance_work_mem = 1GB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
work_mem = 4194kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB

log_min_duration_statement = 700"
}

if ($TotalMemGB -eq 17) {
    $contenuFichier = "# CONNECTIONS AND AUTHENTICATION
listen_addresses = '*'
port = 5432

# REPORTING AND LOGGING
log_directory = '../log'
lc_messages = 'en_US'

# DB Version: 16
# OS Type: windows
# DB Type: mixed
# Total Memory (RAM): 17 GB
# Connections num: 250
# Data Storage: ssd

max_connections = 250
shared_buffers = 4352MB
effective_cache_size = 13056MB
maintenance_work_mem = 1088MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
work_mem = 4456kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB

log_min_duration_statement = 700"
}

if ($TotalMemGB -ge 18) {
    $contenuFichier = "# CONNECTIONS AND AUTHENTICATION
listen_addresses = '*'
port = 5432

# REPORTING AND LOGGING
log_directory = '../log'
lc_messages = 'en_US'

# DB Version: 16
# OS Type: windows
# DB Type: mixed
# Total Memory (RAM): 18 GB
# Connections num: 250
# Data Storage: ssd

max_connections = 250
shared_buffers = 4608MB
effective_cache_size = 13824MB
maintenance_work_mem = 1152MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
work_mem = 4718kB
huge_pages = off
min_wal_size = 1GB
max_wal_size = 4GB

log_min_duration_statement = 700"
}

if ($TotalMemGB -ge 12) {
    # Sépare en lignes
    $contenuLignes = $contenuFichier -split "`n"

    # Écrit avec encodage UTF8 sans BOM et lignes en LF
    [System.IO.File]::WriteAllLines($cheminFichier, $contenuLignes, (New-Object System.Text.UTF8Encoding($false)))
    
    Write-Host "AquiESTEBAN : Fichier postgresql_astree.conf créé avec succès !"
}

###################################
# Modification de postgresql.conf #
###################################

# Modifie la ligne qui mène au fichier de configuration
$cheminFichier = "${Drive}:\Astree\Program\PostgreSQL\16\data\postgresql.conf"
$contenu = Get-Content -Path $cheminFichier
$nouvelleLigne = "include = '../postgresql_astree.conf'"
$ligneNumero = 812

# Modifier la ligne spécifique
$contenu[$ligneNumero] = $nouvelleLigne
$contenu | Set-Content -Path $cheminFichier

Write-Host "AquiESTEBAN : Le document postgresql.conf a été modifié avec succès"

# Redémarrer le service PostgreSQL
Restart-Service -Name "postgresql-x64-16" -Force

Write-Host "AquiESTEBAN : PostgreSQL a bien été redémarré"