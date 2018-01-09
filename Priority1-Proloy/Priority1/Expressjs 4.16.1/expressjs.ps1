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

$setupFolder = "c:\Software-Modules"
Create-Folder "$setupFolder"

#Create-Folder "c:\Software-Modules\Expressjs"




if((Test-Path "$setupFolder\Expressjs_Modules.zip") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/Expressjs_Modules.zip" "$setupFolder\Expressjs_Modules.zip"  
}






Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "$setupFolder\Expressjs_Modules.zip"

$destination = "$setupFolder"



Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)

Remove-Item –path C:\Software-Modules\Expressjs_Modules.zip 

#Start-Process -FilePath C:\haxmextracted\silent_install.bat -WorkingDirectory C:\haxmextracted\ 
