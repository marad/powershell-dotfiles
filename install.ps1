$scriptPath = split-path -parent $MyInvocation.MyCommand.Path

# Setup neovim config files
if (!$(Test-Path -Path "$HOME/AppData/Local/nvim"))
{
    New-Item -ItemType SymbolicLink -Target "$scriptPath/nvim" -Path "$HOME/AppData/Local/nvim"
} else
{
    Write-Output "Neovim folder already in place."
}

# Setup wezterm config
if (!$(Test-Path -Path "$HOME/.wezterm.lua"))
{
    New-Item -ItemType SymbolicLink -Target "$scriptPath/wezterm.lua" -Path "$HOME/.wezterm.lua"
} else
{
    Write-Output "Wezterm configuration already in place."
}

# Setup alacritty config
if (!$(Test-Path -Path "$Env:APPDATA/alacritty/alacritty.toml"))
{
    New-Item -ItemType SymbolicLink -Target "$scriptPath/alacritty.toml" -Path "$Env:APPDATA/alacritty/alacritty.toml" -Force
} else 
{
    Write-Output "Alacritty config already in place"
}

# Setup PowerShell profile
if (Test-Path -Path $profile)
{
    Remove-Item -Path $profile
}
New-Item -ItemType SymbolicLink -Target "$scriptPath/profile.ps1" -Path "$profile" -Force

$starshipConfigPath = "$HOME/.config/starship.toml"
if (Test-Path -Path $starshipConfigPath)
{
    Remove-Item -Path $starshipConfigPath
}
New-Item -ItemType SymbolicLink -Target "$scriptPath/starship.toml" -Path "$starshipConfigPath" -Force

# Helper functions
function Install-Winget-Package
{
    param (
        $Package,
        $Command
    )

    if (!$(get-command $Command -ErrorAction SilentlyContinue))
    {
        winget install $Package
    } else
    {
        Write-Output "$Command already installed."
    }
}

function Install-Cargo-Package
{
    param (
        $Package,
        $Command
    )

    if (!$(get-command $Command -ErrorAction SilentlyContinue))
    {
        cargo install $Package
    } else
    {
        Write-Output "$Command already installed."
    }
}

Install-Winget-Package -Package neovim -Command nvim
Install-Winget-Package -Package wezterm -Command wezterm
Install-Winget-Package -Package fzf -Command fzf

$cargoInstalled = get-command cargo -ErrorAction SilentlyContinue
if ($cargoInstalled)
{
    Install-Cargo-Package -Package sccache -Command sccache
    Install-Cargo-Package -Package eza -Command eza
    Install-Cargo-Package -Package ripgrep -Command rg
    Install-Cargo-Package -Package bat -Command bat
    Install-Cargo-Package -Package starship -Command starship
    Install-Cargo-Package -Package jumper -Command jumper
} else
{
    Write-Output "Install rust's cargo so I can install other required tools!"
}

