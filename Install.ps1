######################
# SCRIPT FONCTIONNEL #
######################

# Permet de prendre en compte UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Vérifie si le script est lancé en administrateur
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

# Récupère le répertoire du script
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $ScriptPath

# Récupère la version de l'outil
$version = Get-Content -Path ".\Version.txt"

# Permet de mettre un titre à la fenêtre de commande
$host.UI.RawUI.WindowTitle = "AquiESTEBAN version $version"

# Write-Host affiche du texte à l'écran
Write-Host "AquiESTEBAN : La version de cet AquiESTEBAN est : $version"
Write-Host "AquiESTEBAN : Veuillez vérifier que vous êtes sur la dernière version de l'installer avec la page Confluence 'AquiESTEBAN [AW6/AW7]"

Pause

# Explication rapide du code de la ligne 11 à la ligne 34 :
# La version de powershell est récupérée dans la variable $PSMajorVersion
# Si c'est égal à 5 ou 7 ça exécute la commande adaptée à la version pour donner les droits admins
# Sinon ça fait une commande qui affiche la version de powershell et c'est à l'utilisateur de la renseigner
# Redémarre Powershell dans le fichier dans lequel il a été arrêté
# Code certainement à optimiser

# Vérifie si le script est lancé en administrateur
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

# Récupère la version de Powershell
$PSMajorVersion = $PSVersionTable.PSVersion.Major

if (-not $principal.IsInRole($adminRole)) {
    do {
        $currentScript = $MyInvocation.MyCommand.Definition
        if ($PSMajorVersion -match "5") {
            # Relance le script en mode administrateur
            Start-Process -FilePath "powershell" -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$currentScript`""
            exit
        } elseif ($PSMajorVersion -match "7") {
            # Relance le script en mode administrateur
            Start-Process -FilePath "pwsh" -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$currentScript`""
            exit
        } else {
            $PSVersionTable.PSVersion
            $PSMajorVersion = Read-Host "AquiESTEBAN : Veuillez entrer la version majeur de Powershell Installer sur le serveur "
        }
    } while ($true)
}

Write-Host "AquiESTEBAN : Le script est exécuté avec les droits administrateurs" -ForegroundColor Green

Write-Host "AquiESTEBAN : Lancement de l'installer de la version 7 d'Aquiweb"

# Récupère la date du jour au format américain
$date = Get-Date -Format "yyyy-MM-dd"

# Demande à l'utilisateur son nom
$Drive = Read-Host "AquiESTEBAN : Veuillez entrer le port d'installation "

# Demander une saisie avec des étoiles (masquer la saisie)
$postgresSecu = Read-Host "AquiESTEBAN : Entrez le mot de passe Postgres " -AsSecureString

# Puis transformation en texte clair
$postgres = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($postgresSecu)
)

#Appel le script 'Général'
.\Fonctions\AquiESTEBAN.ps1 "$Drive" "$postgres" "$date"