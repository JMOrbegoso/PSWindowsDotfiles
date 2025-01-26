<h1 align="center">PSWindowsDotfiles</h1>
<h2 align="center">Create and Run 🚀 Dotfiles projects for Windows 10/11</h2>

<br/>

## 💻 Install

Install it from the [PowerShell Gallery](https://www.powershellgallery.com/packages/PSWindowsDotfiles/):

```PowerShell
Install-Module -Name "PSWindowsDotfiles" -Repository "PSGallery" -Scope "AllUsers";
```

## 🗺️ Usage

1. Import PSWindowsDotfiles:

   ```PowerShell
   Import-Module "PSWindowsDotfiles";
   ```

2. May you need to configure the Execution Policy:

   ```PowerShell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass;
   ```

3. Create a new Dotfiles project:

   ```PowerShell
   New-Dotfiles "$HOME\OneDrive";
   ```

4. Build a super-duper Dotfiles project according to your needs:

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

5. Run it 🚀:

   ```PowerShell
   Install-Dotfiles "$HOME\OneDrive\Dotfiles";
   ```

## 🗺️ Try the example repository before creating your own

1. Clone the repo:

   ```PowerShell
   git clone https://github.com/JMOrbegoso/PSWindowsDotfiles-Example.git $HOME\PSWindowsDotfiles-Example;
   ```

2. Open any Windows PowerShell host console (Except Windows Terminal) with administrator rights and install it:

   ```PowerShell
   Install-Dotfiles $HOME\PSWindowsDotfiles-Example;
   ```

## 👤 Author

**JMOrbegoso:**

- Website: [www.jmorbegoso.dev](https://www.jmorbegoso.dev)
- Blog: [blog.jmorbegoso.dev](https://blog.jmorbegoso.dev)
- Github: [@JMOrbegoso](https://github.com/JMOrbegoso/)
- LinkedIn: [@jmorbegosodev](https://www.linkedin.com/in/jmorbegosodev/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/JMOrbegoso/PSWindowsDotfiles/issues/).

## 🌟Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2023 [JMOrbegoso](https://github.com/JMOrbegoso).<br />
This project is [GNU](https://github.com/JMOrbegoso/PSWindowsDotfiles/blob/main/LICENSE) licensed.
