# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# We don't want to add the embedded bin dir to the main PATH as this
# could mask issues in our binstub shebangs.
$embedded_bin_dir = "C:\opscode\chef\embedded\bin"

# FIXME: we should really use Bundler.with_unbundled_env in the caller instead of re-inventing it here
Remove-Item Env:_ORIGINAL_GEM_PATH -ErrorAction SilentlyContinue
Remove-Item Env:BUNDLE_BIN_PATH -ErrorAction SilentlyContinue
Remove-Item Env:BUNDLE_GEMFILE -ErrorAction SilentlyContinue
Remove-Item Env:GEM_HOME -ErrorAction SilentlyContinue
Remove-Item Env:GEM_PATH -ErrorAction SilentlyContinue
Remove-Item Env:GEM_ROOT -ErrorAction SilentlyContinue
Remove-Item Env:RUBYLIB -ErrorAction SilentlyContinue
Remove-Item Env:RUBYOPT -ErrorAction SilentlyContinue
Remove-Item Env:RUBY_ENGINE -ErrorAction SilentlyContinue
Remove-Item Env:RUBY_ROOT -ErrorAction SilentlyContinue
Remove-Item Env:RUBY_VERSION -ErrorAction SilentlyContinue
Remove-Item Env:BUNDLER_VERSION -ErrorAction SilentlyContinue

# Exercise various packaged tools to validate binstub shebangs
Write-Host ":ruby: Validating Ruby can run"
& $embedded_bin_dir\ruby --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":gem: Validating RubyGems can run"
& $embedded_bin_dir\gem.bat --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":bundler: Validating Bundler can run"
& $embedded_bin_dir\bundle.bat --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":lock: Validating OpenSSL can run"
& $embedded_bin_dir\openssl.exe version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

If ($env:OMNIBUS_FIPS_MODE -eq $true) {
    Write-Host "FIPS is enabled for this environment"
    Write-Host ":closed_lock_with_key: Validating FIPS"
    If ($env:OMNIBUS_FIPS_MODE -eq $true) {
    Write-Host "FIPS is enabled for this environment"
    Write-Host ":closed_lock_with_key: Validating FIPS"
    $env:OPENSSL_FIPS = "1"
    Start-Process -NoNewWindow -Wait "$embedded_bin_dir\openssl.exe" -ArgumentList "md5" -RedirectStandardInput ".\LICENSE"  -PassThru
    If ($lastexitcode -eq 0) {
        Write-Host "FIPS validation failed--md5 should not be available in FIPS mode"
        Throw $lastexitcode
    }
} else {
    Write-Host "FIPS is disabled for this environment"
}

If ((Get-Command "openssl.exe").Source -ne "$embedded_bin_dir\openssl.exe") {
    Write-Host "The default openssl.exe is at: $((Get-Command "openssl.exe").Source),"
    Write-Host "which has version $((Get-Command "openssl.exe").FileVersionInfo.FileVersion)"
}
