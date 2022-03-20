$packageName = 'volume2.portable'
$url = 'https://drive.google.com/uc?export=download&id=1lIN2uZfMqiTJCJ2LaIoI5EYOv8tefiKC'

try {
  $installDir = Join-Path $env:USERPROFILE "AppData\Roaming"
  Install-ChocolateyPath "$installDir"
  $env:Path = "$($env:Path);$installDir"

  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
