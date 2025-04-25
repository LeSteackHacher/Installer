# Demande les différents nombre de licences à l'utilisateur
$XX = Read-Host "AquiESTEBAN : Combien de licence flottante le client possède "
$YY = Read-Host "AquiESTEBAN : Combien de licence atelier le client possède "
$ZZ = Read-Host "AquiESTEBAN : Combien de licence equipement le client possède "

# Récupère l'adresse MAC WIFI ou Ethernet utilisée du serveur
$ActiveAdapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and ($_.Name -match "Wi-Fi|Ethernet") } | Select-Object -First 1
if ($ActiveAdapter) {
    $MAC = $ActiveAdapter.MacAddress
    Write-Output "AquiESTEBAN : Adresse MAC active : $MAC"
} else {
    Write-Output "AquiESTEBAN : Aucune interface Wi-Fi ou Ethernet active trouvée."
}

# Demande si le client a Plant-Data Premium
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous un compte Plant-Data Premium ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $premium = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $premium = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiTIME
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiTIME ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepTIME = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepTIME = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiQUAL
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiQUAL ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepQUAL = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepQUAL = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiDOC
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiDOC ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepDOC = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepDOC = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiMAINT
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiMAINT ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepMAINT = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepMAINT = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiORDO
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiORDO ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepORDO = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepORDO = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiGUIDE
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiGUIDE ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepGUIDE = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepGUIDE = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiTRAÇA
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiTRAÇA ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepTRACA = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepTRACA = $false
        break
    } else {
        Write-Output "`"AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiSTOCK
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiSTOCK ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepSTOCK = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepSTOCK = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Demande si le client a AquiENERGIE
do{
    $reponse = Read-Host "AquiESTEBAN : Avez-vous le module AquiENERGIE ? (oui/non) "

    if ($reponse -match "^(oui|o|yes|y)$") {
        $RepENERGIE = $true
        break
    } elseif ($reponse -match "^(non|n|no)$") {
        $RepENERGIE = $false
        break
    } else {
        Write-Output "AquiESTEBAN : Il faut répondre par Oui ou Non"
    }
} while ($true)

# Création de la liste des modules activés
$modules = @()
if ($RepTIME)   { $modules += "aquitime" }
if ($RepQUAL)   { $modules += "aquiqual" }
if ($RepDOC)    { $modules += "aquidoc" }
if ($RepMAINT)  { $modules += "aquimaint" }
if ($RepORDO)   { $modules += "aquiordo" }
if ($RepGUIDE)  { $modules += "aquiguide" }
if ($RepTRACA)  { $modules += "aquitraca" }
if ($RepSTOCK)  { $modules += "aquistock" }
if ($RepENERGIE){ $modules += "aquienergie" }

# Objet principal de la licence
$licenseObject = [PSCustomObject]@{
    nbFloatingLicense    = [int]$XX
    fixedLicenses        = @(@{ nbLicense = [int]$YY; licenseGroup = "GROUP-ATELIER" })
    nbEquipmentLicense   = [int]$ZZ
    availableModules     = $modules
    expirationDate       = "2099-12-03T10:15:30.000Z"
    macAddresses         = @($MAC)
    plantDataPremium     = $premium
}

# Conversion en JSON en une seule ligne sans indentation
$json = $licenseObject | ConvertTo-Json -Compress

# Affichage
Write-Output "AquiESTEBAN : Voici la licence déchiffrée :"

Write-Host $json

Write-Output "AquiESTEBAN : Copiez la ligne si dessus, mettez la dans votre outil de chiffrage et rentrez le résultat si dessous"

$license = Read-Host "Licence chiffrée"
$cheminFichier = "${Drive}:\Astree\license.aquiweb"
$licenseDef = "`"$license`""
$licenseDef | Out-File -FilePath $cheminFichier -Encoding UTF8

Write-Output "AquiESTEBAN : Licence créée avec succès"
Write-Output "AquiESTEBAN : N'oubliez pas de la versionner"