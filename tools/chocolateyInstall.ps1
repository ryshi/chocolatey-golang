$packageName = 'golang'
$version = '1.5'
$url = 'http://server.pkg/pkgs/golang/go' + $version + '.windows-386.zip'
$url64 = 'http://server.pkg/pkgs/golang/go' + $version + '.windows-amd64.zip'
$validExitCodes = @(0)
$InstallPath = $env:INSTPATH
try {

    if( [String]::IsNullOrEmpty($InstallPath) ){
        $binRoot = Get-BinRoot
    }else{
        $binRoot = $InstallPath
    }

    $goLangRoot = join-path $binRoot "go"

    if (Get-ProcessorBits 64) {
        $curentUrl = $url64
    } else {
        $curentUrl = $url
    }

    if (Test-Path $goLangRoot) {
        Remove-Item "$goLangRoot" -Recurse
    }

    Install-ChocolateyZipPackage "$packageName" "$curentUrl" "$binRoot"

    Install-ChocolateyEnvironmentVariable 'GOROOT' "$goLangRoot" Machine
    # Add bin path to system PATH variable.
    Install-ChocolateyPath "$goLangRoot\bin" Machine
    # Add bin path to user PATH variable.
    #Install-ChocolateyPath "$goLangRoot\bin" User
}
catch {
    #Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw $_.Exception
}
