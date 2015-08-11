$packageName = 'volume2.portable'
$url = 'http://volumesqr.at.ua/Release/Volume2_1_1_4_347.zip'

try {
  $installDir = Join-Path $env:USERPROFILE "AppData\Roaming"
  Install-ChocolateyPath "$installDir"
  $env:Path = "$($env:Path);$installDir"

  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
