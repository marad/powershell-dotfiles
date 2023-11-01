Set-Alias ls eza
Set-Alias cat bat
New-Alias grep rg

function Jump-Location {
    if ([string]::IsNullOrEmpty($args)) {
        $selected = $(jumper list | fzf --ansi).Split('|')[-1].Trim()
        Set-Location -Path $selected
    } else {
        Set-Location -Path $(jumper get $args)
    }
}
New-Alias jg Jump-Location

$prompt = ""
function Invoke-Starship-PreCommand {
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.ProviderPath -replace "\\", "/"
        $prompt = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}$ansi_escape\"
    }
    $host.ui.Write($prompt)
}

Invoke-Expression (&starship init powershell)

# Setup rust compilation wrapper for faster builds
$sccache = get-command sccache
if ($sccache) {
    $Env:RUSTC_WRAPPER = $sccache.Source
}
