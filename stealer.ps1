 param (
    [string]$destination,
    [string]$prefix
 )

Write-Output ("dest="+$destination)
if ($destination -eq ""){
    Write-Output "Hedef Belirtilmeli"
    break
}
if ($prefix -ne ""){
    $prefix=($prefix+"-")
}
#if ($destination.Substring(0, 2) -eq "\\"){
#    break
#}
Try { 
    [io.file]::OpenWrite($destination+"\testfile").close()
} Catch {
  Write-Error "Yazma Izni Yok $destination"
  break
}
[io.file]::Delete(($destination+"\testfile")).close()


$dummy = [System.Reflection.Assembly]::LoadFrom(
    "c:\windows\System32\InetSrv\Microsoft.Web.Administration.dll")

$srvmgr = new-object Microsoft.Web.Administration.ServerManager


foreach($site in $srvmgr.Sites | Sort-Object Name ) {
  foreach($app in $site.Applications | Sort-Object Path ) {
    foreach($virt in $app.VirtualDirectories | Sort-Object Path ) {

      write-Output  ($site.Name + "`t" + $site.State + "`t" + $app.Path + "`t" + $virt.Path + "`t" + $virt.PhysicalPath)
      $PhyPath=$virt.PhysicalPath.replace("%SystemDrive%",$env:SystemDrive).replace("%windir%",$env:windir)
      $Path=$app.Path.replace("/","");
      if ($Path -eq ""){ $Path="ROOT" }
      Remove-Item ($env::TEMP+"\temp.zip")
      $zipdest = $destination+"\"+$prefix+$env:computername+"-"+$site.Name+"-"+$Path+"-archive.zip"
      write-Output ("zip  "+($env::TEMP+"\temp.zip")+" -r "+$PhyPath)
       zip  ($env::TEMP+"\temp.zip") -r $PhyPath
       Copy-Item -Path ($env::TEMP+"\temp.zip") -Destination $zipdest
       Remove-Item ($env::TEMP+"\temp.zip")
       

    }
  }
} 
