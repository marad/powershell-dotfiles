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

Invoke-Expression (&starship init powershell)

# Setup rust compilation wrapper for faster builds
$sccache = get-command sccache
if ($sccache) {
    $Env:RUSTC_WRAPPER = $sccache.Source
}
