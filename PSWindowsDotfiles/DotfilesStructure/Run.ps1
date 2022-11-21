# Install & configure base apps
Invoke-Expression "$env:DOTFILES_PATH\base\base.ps1";

# Install & configure programming languages
Invoke-Expression "$env:DOTFILES_PATH\langs\langs.ps1";

# Install & configure apps
Invoke-Expression "$env:DOTFILES_PATH\apps\install.ps1";

# Update & configure apps
Invoke-Expression "$env:DOTFILES_PATH\apps\update.ps1";

# Configure the Operating System
Invoke-Expression "$env:DOTFILES_PATH\os\os.ps1";

# Clean Dotfiles temp folder & clean the Operating System
Invoke-Expression "$env:DOTFILES_PATH\clean\clean.ps1";
