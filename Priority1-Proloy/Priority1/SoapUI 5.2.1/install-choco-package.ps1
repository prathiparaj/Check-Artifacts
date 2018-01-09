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
Create-Folder $setupFolder



#download sonar file
if((Test-Path "$setupFolder\SoapUI-x64-5.2.1.exe") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/SoapUI-x64-5.2.1.exe" "$setupFolder\SoapUI-x64-5.2.1.exe"  
}

if((Test-Path "$setupFolder\sonarqube-6.0.zip") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/soap.bat" "$setupFolder\soap.bat"  
}



#Remove Zip file

Start-Process -FilePath "C:\Software-Modules\soap.bat"-Wait
Remove-Item –Path "$setupFolder\SoapUI-x64-5.2.1.exe" -Recurse
Remove-Item –Path "$setupFolder\soap.bat" -Recurse


