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



#download Bamboo exe
if((Test-Path "$setupFolder\atlassian-bamboo-6.3.0-windows-x64.exe") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/atlassian-bamboo-6.3.0-windows-x64.exe" "$setupFolder\atlassian-bamboo-6.3.0-windows-x64.exe"  
}

if((Test-Path "$setupFolder\Bamboo.bat") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/Bamboo.bat" "$setupFolder\Bamboo.bat"  
}
# Install Bamboo
Start-Process -FilePath "$setupFolder\Bamboo.bat"
Start-Sleep -s 50



# Install Bamboo as Service
Start-Process -FilePath "C:\Program Files\Bamboo\InstallAsService.bat" 
#Start-Sleep -s 10

# Start Bamboo Service
Start-Process -FilePath "C:\Program Files\Bamboo\bin\start-bamboo.bat"

sc config bamboo start='auto'

net start bamboo
#Start-Sleep -s 10
#Start-Process -FilePath "C:\Program Files\Bamboo\bin\start-bamboo.bat"
#Start-Sleep -s 10



# Start Bamboo Service
#Start-Process -FilePath "C:\Program Files\Bamboo\StartBamboo.bat"
#Start-Sleep -s 10

# Start Bamboo Console
#Start-Process -FilePath "C:\Program Files\Bamboo\BambooConsole.bat"
#Start-Sleep -s 10


 #Remove exe
Remove-Item –Path "$setupFolder\atlassian-bamboo-6.3.0-windows-x64.exe"

#Remove exe
Remove-Item –Path "$setupFolder\Bamboo.bat" 
