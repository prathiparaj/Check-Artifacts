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

$setupFolder = "c:\Software-Modules\Jbehave"
Create-Folder $setupFolder



#download sonar file
if((Test-Path "$setupFolder\jbehave-core-4.1.3.jar") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/jbehave-core-4.1.3.jar" "$setupFolder\jbehave-core-4.1.3.jar"  
}


if((Test-Path "$setupFolder\jbehave.bat") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/jbehave.bat" "$setupFolder\jbehave.bat"  
}

Start-Process -FilePath "$setupFolder\jbehave.bat" -Wait

Remove-Item -Path "$setupFolder\jbehave.bat"