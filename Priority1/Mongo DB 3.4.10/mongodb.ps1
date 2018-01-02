function Create-Folder {
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

$setupFolder = "C:\Mongodb"
Create-Folder "$setupFolder"

#Create-Folder "c:Program Files\"




if((Test-Path "$setupFolder\mongodb-win32-x86_64-enterprise-windows-64-3.4.10-signed.msi") -eq $false)
{
  
        Download-File "https://mylibrary123.blob.core.windows.net/reposit/mongodb-win32-x86_64-enterprise-windows-64-3.4.10-signed.msi" "$setupFolder\mongodb-win32-x86_64-enterprise-windows-64-3.4.10-signed.msi"  
}

Get-ChildItem -Path $setupFolder -Recurse | Unblock-File


cd "C:\Mongodb"


msiexec.exe /q /i mongodb-win32-x86_64-enterprise-windows-64-3.4.10-signed.msi  INSTALLLOCATION="C:\Mongodb" ADDLOCAL=ALL


Start-Sleep -s 50;




Remove-Item -Path "C:\Mongodb\mongodb-win32-x86_64-enterprise-windows-64-3.4.10-signed.msi"

#$Source = "C:\Mongodb"
#$Destination = 'C:\Program Files\'
#Get-ChildItem $Destination | ForEach-Object {Copy-Item -Path $Source -Destination $_ -Force -Recurse}