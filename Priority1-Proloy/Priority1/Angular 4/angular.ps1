$env:Path += ";C:\Program Files\nodejs"
npm install -g @angular/cli

$Source = "C:\Windows\System32\config\systemprofile\AppData\Roaming\npm"
$Destination = 'C:\users\*\AppData\Roaming'
Get-ChildItem $Destination | ForEach-Object {Copy-Item -Path $Source -Destination $_ -Force -Recurse}
#npm install -g @angular/cli -FilePath "$Env:USERPROFILE\AppData\Roaming"


#[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Windows\system32\config\systemprofile\AppData\Roaming\npm", "Machine")
#$env:Path += ";C:\Windows\system32\config\systemprofile\AppData\Roaming\npm"
#pwd