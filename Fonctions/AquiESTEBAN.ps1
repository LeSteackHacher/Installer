param($Drive, $postgres, $date)

Pause

Clear-Host

Write-Host "AquiESTEBAN : Création architecture de base d'Aquiweb"

.\Fonctions\Fonctions\1_Dossiers.ps1 "$Drive" "$date"

pause

Clear-Host

Write-Host "AquiESTEBAN : Installation des dépendances"

.\Fonctions\Fonctions\2_7-zip.ps1 "$Drive"

pause

.\Fonctions\Fonctions\3_Notepad.ps1 "$Drive"

pause

.\Fonctions\Fonctions\4_Chrome.ps1 "$Drive"

pause

.\Fonctions\Fonctions\5_PostgreSQL.ps1 "$Drive" "$postgres"

pause

.\Fonctions\Fonctions\5.5_ConfigPostgreSQL.ps1 "$Drive"

pause

.\Fonctions\Fonctions\6_PGAdmin.ps1 "$Drive"

pause

Clear-Host

Write-Host "AquiESTEBAN : Installation des dépendances secondaires"

.\Fonctions\Fonctions\12_DBeaver.ps1 "$Drive" "$date"

pause

.\Fonctions\Fonctions\13_SpaceSniffer.ps1 "$Drive" "$date"

pause

.\Fonctions\Fonctions\14_Klogg.ps1 "$Drive" "$date"

pause

Clear-Host

Write-Host "AquiESTEBAN : Mise en place des fichiers d'Aquiweb"

.\Fonctions\Fonctions\7_Dezippage.ps1 "$Drive" "$date"

pause

Clear-Host

Write-Host "AquiESTEBAN : Installation de Java"

.\Fonctions\Fonctions\8_Java.ps1 "$Drive" "$date"

pause

Clear-Host

Write-Host "AquiESTEBAN : Création de la licence Aquiweb"

.\Fonctions\Fonctions\9_License.ps1

pause

Clear-Host

Write-Host "AquiESTEBAN : Installation des services Aquiweb"

.\Fonctions\Fonctions\10_Installation.ps1 "$Drive"

# Remet le script au bon endroit car l'install des services le déplace
# (L'installation des services déplace l'invite de commande d'endroit)
Set-Location -Path "${Drive}:\Installer"

pause

Clear-Host

Write-Host "AquiESTEBAN : Création des utilisateurs et de la BDD Aquiweb"

.\Fonctions\Fonctions\11_PostgreSQL.ps1 "$Drive" "$date" "$postgres"