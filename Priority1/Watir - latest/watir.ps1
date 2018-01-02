# Silent SASS using RubyInstaller

[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Ruby23-x64\bin\;C:\RubyDevKit;C:\Ansicon\x64", "Machine") 
$env:Path += ";C:\Ruby23-x64\bin\"
$env:Path += ";C:\Ansicon\x64" 

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

# Silent SASS using RubyInstaller
$workdir = "C:\installer\"
# Check if work directory exists if not create it
If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }
# Download the installer
$source = "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/rubyinstaller-2.4.2-2-x64.exe"
$destination = "$workdir\rubyinstaller-2.4.2-2-x64.exe"
# Check if Invoke-Webrequest exists otherwise execute WebClient
if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}
Invoke-WebRequest $source -OutFile $destination 
# Start the installation
Start-Process -FilePath "C:\installer\rubyinstaller-2.4.2-2-x64.exe" -ArgumentList "/verysilent /tasks='assocfiles,modpath'" -PassThru -Wait 

# Wait XX Seconds for the installation to finish
Start-Sleep -s 50
ruby -v


#Get-ChildItem $Destinationruby | ForEach-Object {Copy-Item -Path $Sourceruby -Destination $_ -Force -Recurse}

# Install Devkit

#Setup Folders

$setupFolder = "C:\RubyDevKit"
#Create-Folder "$setupFolder"
Create-Folder "C:\RubyDevKit"




if((Test-Path "C:\RubyDevKit\DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe") -eq $false)
{
  
        Download-File "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe" "C:\RubyDevKit\DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe"  
        Start-Process "C:\RubyDevKit\DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe" -ArgumentList "-oC:\RubyDevKit -y" -PassThru -Wait
        cd C:\RubyDevKit
        ruby dk.rb init
        Add-Content -Path "C:\RubyDevKit\config.yml" -Value '- C:\Ruby23-x64' -PassThru
        ruby dk.rb install

#install sass
gem install watir
#cucumber --version

}


# Remove the installer
#rm -Force $workdir\rubyinstaller-2.3.3-x64.exe
