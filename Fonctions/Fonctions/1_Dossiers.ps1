param($Drive, $date)

# Créer les répertoires de base pour l'installation
# Pour Aquiweb
New-Item -Path "${Drive}:\Astree\Aquiweb" -ItemType Directory

# Pour la livraison
New-Item -Path "${Drive}:\Astree\Livraison\${date}" -ItemType Directory

# Pour PostgreSQL
New-Item -Path "${Drive}:\Astree\Program\PostgreSQL\16\data" -ItemType Directory
New-Item -Path "${Drive}:\Astree\Program\PostgreSQL\16\log" -ItemType Directory

# Pour clés RSA
New-Item -Path "${Drive}:\Astree\rsa" -ItemType Directory

# Pour Java
New-Item -Path "C:\Program Files\Java" -ItemType Directory