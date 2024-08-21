set shell := ["zsh", "-uc"]
set windows-shell := ["pwsh.exe", "-NoLogo", "-Command"]

[private]
@default:
    just --list --justfile {{justfile()}}

# Clear the state of `run_onchange_` scripts
clear-run-on-change-state:
    chezmoi state delete-bucket --bucket=entryState

# Clear the state of `run_once_` scripts
clear-run-once-state:
    chezmoi state delete-bucket --bucket=scriptState

# Add nuget.org as a dotnet source
dotnet-nuget-add-source:
    dotnet nuget add source "https://api.nuget.org/v3/index.json" --name "nuget.org"
