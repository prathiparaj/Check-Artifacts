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

#$setupFolder = "c:\Software-Modules"
#Create-Folder "$setupFolder"

#Create-Folder "c:\Spring-Framework"




#if((Test-Path "$setupFolder\intellijidea-community.bat") -eq $false)
#{
  
        #Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/intellijidea-community.bat" "$setupFolder\intellijidea-community.bat"  
#}

#Start-Process -FilePath $setupFolder\intellijidea-community.bat -Wait


$env:Path += ";C:\ProgramData\chocolatey"
choco install intellijidea-community -y

#mysqld --initialize
#mysqld
#& cmd /c  'mysqld --initialize' 
#& cmd /c  'mysqld'
