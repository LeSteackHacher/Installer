param($Drive)

Add-Type -AssemblyName System.Windows.Forms

# Pop-up avec uniquement OK
[System.Windows.Forms.MessageBox]::Show("Création de la BDD Aquiweb", "Redémarrage", "OK", "Information")

# Lancer une nouvelle session PowerShell avec ton script
$scriptToRun = "${Drive}:\Installer\Fonctions\Fonctions\100_PostgreSQL.ps1"
Start-Process "powershell.exe" -ArgumentList "-NoExit", "-ExecutionPolicy Bypass", "-File `"$scriptToRun`""

# Fermer la session actuelle
exit