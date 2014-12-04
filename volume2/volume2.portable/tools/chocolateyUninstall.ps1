$packageName = "volume2.portable"
$appDir = Join-Path $env:USERPROFILE "AppData\Roaming\Volume2"

try {
    if (Test-Path $appDir)
    {
        Remove-Item "$($appDir)" -Recurse -Force
    }
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}