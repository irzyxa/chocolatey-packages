$packageName = 'volume2.portable'
$url = 'https://github.com/irzyxa/Volume2/releases/download/26.2.0.746/Volume2_26_0_0_476_x64.zip'
$checkSum = '9feb2b53c2efbb73e6547efc8951bcd11c1c75d0df9182fcf59b75f47091564b'

try {
  $installDir = Join-Path $env:USERPROFILE "AppData\Roaming"
  Install-ChocolateyPath "$installDir"
  $env:Path = "$($env:Path);$installDir"

  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir" -ChecksumType "sha256" -Checksum $checkSum
} catch {
  throw
}
