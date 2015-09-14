$InstallPath = $env:INSTPATH

if( [String]::IsNullOrEmpty($InstallPath) ){
    $binRoot = Get-BinRoot
}else{
    $binRoot = $InstallPath
}

$goLangRoot = join-path $binRoot "go"

if (Test-Path $goLangRoot) {
    Remove-Item "$goLangRoot" -Recurse
}