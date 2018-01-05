$uri = "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/toadedge_1.2.0_x64_en.msi"
$out = "c:\toadedge_1.2.0_x64_en.msi"
Invoke-WebRequest -uri $uri -OutFile $out
Start-Process -FilePath "c:\toadedge_1.2.0_x64_en.msi" -ArgumentList "/i $out /quiet /norestart /l c:\installlog.txt"  
