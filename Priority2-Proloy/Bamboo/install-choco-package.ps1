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
if((Test-Path "$setupFolder\atlassian-bamboo-6.3.0-windows-x64.exe") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/atlassian-bamboo-6.3.0-windows-x64.exe" "$setupFolder\atlassian-bamboo-6.3.0-windows-x64.exe"  
}

cmd.exe $setupFolder\atlassian-bamboo-6.3.0-windows-x64.exe -q	



  #Remove Zip file
Remove-Item –Path "$setupFolder\atlassian-bamboo-6.3.0-windows-x64.exe" -Recurse