function Create-Folder 
{
    Param ([string]$path)
    if ((Test-Path $path) -eq $false) 
    {
        Write-Host "$path doesn't exist. Creating now.."
        New-Item -ItemType "directory" -Path $path
    }
}

function Download-File{
    Param ([string]$src, [string] $dst)

    (New-Object System.Net.WebClient).DownloadFile($src,$dst)
    #Invoke-WebRequest $src -OutFile $dst
}

function WaitForFile($File) {
  while(!(Test-Path $File)) {    
    Start-Sleep -s 10;   
  }  
} 


#Setup Folders

$setupFolder = "c:\Program Files"
#Create-Folder "$setupFolder"
Create-Folder "c:\Program Files\Subversion"




if((Test-Path "$setupFolder\Apache-Subversion-1.9.7.zip") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/Apache-Subversion-1.9.7%20(1).zip" "$setupFolder\Apache-Subversion-1.9.7.zip"  
}

Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "$setupFolder\Apache-Subversion-1.9.7.zip"

$destination = "C:\Program Files\Subversion"



Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)

Remove-Item –path "C:\Program Files\Apache-Subversion-1.9.7.zip" 


#Create-Folder "C:\\Subversion"



#$env:Path += ";C:\Windows\System32\config\systemprofile\AppData\Roaming" 

$Source = "C:\Program Files\Subversion"
#Get-ChildItem $source
$Destination = 'C:\Users\*\AppData\Roaming\Subversion'
Get-ChildItem $Destination | ForEach-Object {Copy-Item -Path $Source -Destination $Destination -Force -Recurse}

   # Start-Sleep -s 30;  



#$Source = "C:\Windows\System32\config\systemprofile\AppData\Roaming\npm"
#$Destination = 'C:\users\*\AppData\Roaming'
#Get-ChildItem $Destination | ForEach-Object {Copy-Item -Path $Source -Destination $_ -Force -Recurse} 

#[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Program Files\Subversion\bin", "Machine")


[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Program Files\Subversion\bin", "Machine")



#Create-Folder "C:\Users\*\AppData\Roaming\Subversion"

#$Source = "C:\Program Files\Subversion\"
#Get-ChildItem $source
#$Destination = 'C:\Users\*\AppData\Roaming'
#Get-ChildItem $Destination | ForEach-Object {Copy-Item -Path $Source -Destination $Destination -Force -Recurse} 

Copy-Item -Path "C:\Program Files\Subversion" -Destination "C:\users\$env:username\AppData\Roaming" -Force -Recurse 


#ForEach ($user in (Get-ChildItem "C:\Users" -Exclude Public)) {
    #$Source = "C:\Program Files\Subversion\"

    #Copy-Item -Path "MyFile.txt" -Destination "C:\Users\$user\AppData\Roaming" -Force -Recurse
#}
    
    



svn --version
