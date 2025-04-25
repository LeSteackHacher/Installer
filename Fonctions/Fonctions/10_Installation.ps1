param($Drive)

$aquiweb_folder = "${drive}:\Astree\aquiweb"
$aquiweb_Aquiweb_folder = "$aquiweb_folder\aquiweb"
$aquiweb_Aquisition_folder = "$aquiweb_folder\acquisition"
$aquiweb_OIDC_folder = "$aquiweb_folder\oidcServer"
$aquiweb_PlantData_folder = "$aquiweb_folder\plantdata"

$services = @(
    $aquiweb_Aquiweb_folder,
    $aquiweb_Aquisition_folder,
    $aquiweb_OIDC_folder,
    $aquiweb_PlantData_folder
)

$service_scripts = @(
    "service-install.bat",
    "service-install.bat",
    "service-install.bat",
    "service-install.bat"
)

for ($i = 0; $i -lt $services.Length; $i++) {
    $servicePath = "$($services[$i])\service"
    $scriptPath = "$servicePath\$($service_scripts[$i])"
    if (Test-Path $scriptPath) {
        Set-Location $servicePath
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c $scriptPath" -Wait -NoNewWindow
    }
}

$serviceNames = @(
    "Aquiweb",
    "Acquisition",
    "OidcServer",
    "PlantdataServer"
)

foreach ($service in $serviceNames) {
    Start-Process -FilePath "sc.exe" -ArgumentList "config $service start= delayed-auto" -Wait -NoNewWindow
    Start-Process -FilePath "sc.exe" -ArgumentList "failure $service reset= 86400 actions= restart/60000/restart/60000//" -Wait -NoNewWindow
    Start-Process -FilePath "sc.exe" -ArgumentList "failureflag $service 1" -Wait -NoNewWindow
}

Write-Output "AquiESTEBAN : Les services d'Aquiweb ont bien été installés"