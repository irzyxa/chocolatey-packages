$packageName = 'volume2.portable'
$url = 'https://github.com/irzyxa/Volume2/releases/download/v1.1.8/Volume2_1_1_8_465.zip'
$checkSum = 'a38f940d98054f5e0d615e2e9416734a97ad2575eb40df18349e33ea2173ce30'

try {
  $installDir = Join-Path $env:USERPROFILE "AppData\Roaming"
  Install-ChocolateyPath "$installDir"
  $env:Path = "$($env:Path);$installDir"

  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir" -ChecksumType "sha256" -Checksum $checkSum
} catch {
  throw
}
