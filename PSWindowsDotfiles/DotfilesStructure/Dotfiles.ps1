# Install & configure base apps
Invoke-Expression "$env:DOTFILES_PATH\Base\Base.ps1";

# Install & configure programming languages
Invoke-Expression "$env:DOTFILES_PATH\Langs\Langs.ps1";

# Install & configure apps
Invoke-Expression "$env:DOTFILES_PATH\Apps\Install.ps1";

# Update & configure apps
Invoke-Expression "$env:DOTFILES_PATH\Apps\Update.ps1";

# Configure the Operating System
Invoke-Expression "$env:DOTFILES_PATH\OS\OS.ps1";

# Clean Dotfiles temp folder & clean the Operating System
Invoke-Expression "$env:DOTFILES_PATH\Clean\Clean.ps1";
