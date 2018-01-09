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

$setupFolder = "c:\JUNIT"
Create-Folder "$setupFolder"

#Create-Folder "c:\Spring-Framework"




if((Test-Path "$setupFolder\junit-4.12.jar") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/junit-4.12.jar" "$setupFolder\junit-4.12.jar"  
        Download-File "https://mylibrary123.blob.core.windows.net/reposit/Junit%20configuration.txt" "$setupFolder\Junit%20configuration.txt"
}


#Adding env variable
[System.Environment]::SetEnvironmentVariable("JUNIT_HOME", "C:\JUNIT", "User")
[System.Environment]::SetEnvironmentVariable("CLASSPATH", "%CLASSPATH%;%JUNIT_HOME%\junit4.12.jar;.;", "User")








  
