$packageName = 'volume2.portable'
$url = 'https://github.com/irzyxa/Volume2/releases/download/v1.1.7/Volume2_1_1_7_449.zip'

try {
  $installDir = Join-Path $env:USERPROFILE "AppData\Roaming"
  Install-ChocolateyPath "$installDir"
  $env:Path = "$($env:Path);$installDir"

  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
