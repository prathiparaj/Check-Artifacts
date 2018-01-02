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

$setupFolder = "c:\postgrespro"
Create-Folder "$setupFolder"

#Create-Folder "c:\Spring-MVC-All-modules"




if((Test-Path "$setupFolder\postgresql-10.1-2-windows-x64.exe") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/postgresql-10.1-2-windows-x64.exe" "$setupFolder\postgresql-10.1-2-windows-x64.exe"  
}



#Start-Process -FilePath C:\haxmextracted\silent_install.bat -WorkingDirectory C:\haxmextracted\

#C:\Users\prodevtest\Downloads\postgresql-10.1-2-windows-x64.exe  --help

C:\postgrespro\postgresql-10.1-2-windows-x64.exe --unattendedmodeui minimal --mode unattended --superpassword "password" --servicename "postgreSQL" --servicepassword "password" --serverport 5432
#Remove-Item –path C:\postgrespro -Recurse