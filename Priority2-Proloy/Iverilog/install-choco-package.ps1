


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
if((Test-Path "$setupFolder\iverilog-10-1-1-x64_setup.exe") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/iverilog-10-1-1-x64_setup.exe" "$setupFolder\iverilog-10-1-1-x64_setup.exe"  
}



Start-Process -FilePath "$setupFolder\iverilog-10-1-1-x64_setup.exe" -ArgumentList "/verysilent" -Wait


#Remove Zip file
Remove-Item –Path "$setupFolder\iverilog-10-1-1-x64_setup.exe" -Recurse
	












