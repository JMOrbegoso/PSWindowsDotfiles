<h1 align="center">PSWindowsDotfiles</h1>
<h2 align="center">Create and Run 🚀 Dotfiles projects for Windows 10/11</h2>

<br/>

## 💻 Install

Install it from the [PowerShell Gallery](https://www.powershellgallery.com/packages/PSWindowsDotfiles/):

```PowerShell
Install-Module -Name PSWindowsDotfiles
```

## 🗺️ Usage

1. Create a new Dotfiles project:

   ``` PowerShell
   New-Dotfiles "~\OneDrive"
   ```

2. Build a super-duper Dotfiles project according to your needs:

   ```Explorer
   Dotfiles
   │
   │── Apps
   │    │── git
   │    │── powershell
   │    │── vscode
   │    │── windows-terminal
   │    └── winfetch
   │
   │── Base
   │── Clean
   │── Helpers
   │── Langs
   │── OS
   │── Shell
   │     │── Exports
   │     │── Functions
   │     │── Images
   │     │── Scripts
   │     └── Themes
   │
   └── Dotfiles.ps1
   ```

3. Run a Dotfiles project:

   ``` PowerShell
   Install-Dotfiles "~\OneDrive\Dotfiles"
   ```

## 👤 Author

**JMOrbegoso:**

- Website: [jmorbegoso.com](https://www.jmorbegoso.com)
- Twitter: [@JMOrbegosoDev](https://twitter.com/JMOrbegosoDev/)
- Github: [@JMOrbegoso](https://github.com/JMOrbegoso/)
- LinkedIn: [@jmorbegosodev](https://www.linkedin.com/in/jmorbegosodev/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/JMOrbegoso/PSWindowsDotfiles/issues/).

## 🌟Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2023 [JMOrbegoso](https://github.com/JMOrbegoso).<br />
This project is [GNU](https://github.com/JMOrbegoso/PSWindowsDotfiles/blob/main/LICENSE) licensed.
