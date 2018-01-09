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
if((Test-Path "$setupFolder\eclipse-standard-kepler-SR2-win32-x86_64.zip") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/eclipse-standard-kepler-SR2-win32-x86_64.zip" "$setupFolder\eclipse-standard-kepler-SR2-win32-x86_64.zip"  
}


#unzip
	
	Add-Type -assembly "system.io.compression.filesystem"
	
	$BackUpPath = "$setupFolder\eclipse-standard-kepler-SR2-win32-x86_64.zip"
	
	$destination = "C:\Program Files"
	
	
	
	Add-Type -assembly "system.io.compression.filesystem"
	
	[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)


	

$wshshell = New-Object -ComObject WScript.Shell
$desktop = 'C:\Users\Public\Desktop'
  $lnk = $wshshell.CreateShortcut($desktop+"\eclipse.lnk")
  $lnk.TargetPath = "c:\Program Files\eclipse\eclipse.exe"
  $lnk.Save()  

  #Remove Zip file
Remove-Item –Path "$setupFolder\eclipse-standard-kepler-SR2-win32-x86_64.zip" -Recurse