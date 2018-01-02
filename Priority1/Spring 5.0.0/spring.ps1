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

#Create-Folder "c:\Spring-Framework"




if((Test-Path "$setupFolder\spring-framework-5.0.1.RELEASE-dist.zip") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/spring-framework-5.0.1.RELEASE-dist.zip" "$setupFolder\spring-framework-5.0.1.RELEASE-dist.zip"  
}






Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "$setupFolder\spring-framework-5.0.1.RELEASE-dist.zip"

$destination = "C:\Software-Modules"



Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)

Remove-Item –path "C:\Software-Modules\spring-framework-5.0.1.RELEASE-dist.zip" -Recurse

#Start-Process -FilePath C:\haxmextracted\silent_install.bat -WorkingDirectory C:\haxmextracted\ 





Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "$setupFolder\spring-framework-5.0.1.RELEASE-dist.zip"

$destination = "C:\Software-Modules\Spring-Framework"



Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)

Remove-Item –path C:\spring_frameworks -Recurse

#Start-Process -FilePath C:\haxmextracted\silent_install.bat -WorkingDirectory C:\haxmextracted\