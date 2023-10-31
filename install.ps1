$scriptPath = split-path -parent $MyInvocation.MyCommand.Path

New-Item -ItemType SymbolicLink -Target "$scriptPath/nvim" -Path "$HOME/AppData/Local/nvim"
