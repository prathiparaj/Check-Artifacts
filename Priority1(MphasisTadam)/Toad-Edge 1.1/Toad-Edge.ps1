$uri = "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/ToadEdge.msi"
$out = "c:\ToadEdge.msi"
Invoke-WebRequest -uri $uri -OutFile $out
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $out /quiet /norestart /l c:\installlog.txt"  
