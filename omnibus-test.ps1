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
& $embedded_bin_dir\ruby --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

& $embedded_bin_dir\gem.bat --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

& $embedded_bin_dir\bundle.bat --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":lock: Validating OpenSSL can run"
& $embedded_bin_dir\openssl.exe version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":lock: Validating OpenSSL executable"
Start-Process -NoNewWindow -Wait "$embedded_bin_dir\openssl.exe" -ArgumentList "sha3-512" -RedirectStandardInput ".\LICENSE"  -PassThru
If ($lastexitcode -ne 0) {
    Write-Host "sha3 failed"
    Throw $lastexitcode
}
If ($end:OMNIBUS_FIPS_MODE -eq $true) {
    $env:OPENSSL_FIPS = "1"
}

& $embedded_bin_dir\bundle install --jobs=2 --retry=3

If ($env:OMNIBUS_FIPS_MODE -eq $true) {
    Write-Host "FIPS is enabled for this environment"
    Write-Host ":closed_lock_with_key: Validating FIPS"
    Start-Process -NoNewWindow -Wait "$embedded_bin_dir\openssl.exe" -ArgumentList "md5" -RedirectStandardInput ".\LICENSE"  -PassThru
    If ($lastexitcode -eq 0) {
        Write-Host "FIPS validation failed--md5 should not be available in FIPS mode"
        # Throw $lastexitcode
    }

    Write-Host "Checking if FIPS is accessible via the Ruby OpenSSL bindings"
    & $embedded_bin_dir/ruby.exe -v -e "require 'openssl'; puts OpenSSL::OPENSSL_VERSION_NUMBER.to_s(16); puts OpenSSL::OPENSSL_LIBRARY_VERSION; OpenSSL.fips_mode = 1"
    If ($lastexitcode -ne 0) {
        Write-Host "FIPS validation failed--Ruby OpenSSL bindings should not be available in FIPS mode"
        Throw $lastexitcode
    }

    Start-Process -NoNewWindow -Wait "$embedded_bin_dir\openssl.exe" -ArgumentList "md5" -RedirectStandardInput ".\LICENSE"  -PassThru
    If ($lastexitcode -eq 0) {
        Write-Host "FIPS validation failed--md5 should not be available in FIPS mode"
        Throw $lastexitcode
    }
    Start-Process -NoNewWindow -Wait "$embedded_bin_dir\openssl.exe" -ArgumentList "list", "-providers" -PassThru
} else {
    Write-Host "FIPS is disabled for this environment"
}

If ((Get-Command "openssl.exe").Source -ne "$embedded_bin_dir\openssl.exe") {
    Write-Host "The default openssl.exe is at: $((Get-Command "openssl.exe").Source),"
    Write-Host "which has version $((Get-Command "openssl.exe").FileVersionInfo.FileVersion)"
}