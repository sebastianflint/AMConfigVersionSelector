<div align="center">

<br/>

```
██╗   ██╗██╗    ██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
██║   ██║██║    ██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
██║   ██║██║ █╗ ██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██║   ██║██║███╗██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
╚██████╔╝╚███╔███╔╝██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
 ╚═════╝  ╚══╝╚══╝ ╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
```

### **Config Version Selector**
*A modern tool for managing Ivanti UWM / Environment Manager configurations*

<br/>

![Version](https://img.shields.io/badge/version-3.1-4f8cff?style=for-the-badge&labelColor=13161e)
![Platform](https://img.shields.io/badge/platform-Windows-7c5cfc?style=for-the-badge&labelColor=13161e)
![Framework](https://img.shields.io/badge/.NET_Framework-4.x-2dd98e?style=for-the-badge&labelColor=13161e)
![Language](https://img.shields.io/badge/C%23-WinForms-e8ecf8?style=for-the-badge&labelColor=13161e)
![License](https://img.shields.io/badge/license-MIT-ff5a5a?style=for-the-badge&labelColor=13161e)

<br/>

</div>

---

## ⚙️ What is this?

**UWM ConfigVersionSelector** is a lightweight Windows desktop tool built for IT administrators and consultants working with **Ivanti Unified Endpoint Manager (UEM)**.

It allows you to:
- Load `.aamp` (Application Manager) and `.aemp` (Environment Manager) config files
- Inspect config metadata at a glance
- Launch the correct AM or EM console version that matches the config — automatically
- Drag & drop configs directly onto the window

No more manually hunting for the right console version. Drop the config, the tool figures it out.

---

## ✨ Features

| Feature | Description |
|---|---|
| 📂 **Drag & Drop** | Drop any `.aamp` or `.aemp` file directly onto the window |
| 🔍 **Config Inspection** | Instantly displays config name, version, creator version and product name |
| 🖥️ **Auto Console Match** | Automatically selects the matching AM or EM console version |
| 🚀 **One-Click Launch** | Opens the correct `AMConsole.exe` or `EMConsole.exe` with the config as argument |
| 🔄 **Update Check** | Checks GitHub releases on startup for newer versions |
| 🌑 **Dark UI** | Modern borderless dark theme — easy on the eyes during long sessions |
| 📌 **System Tray** | Minimizes to tray, always accessible |

---

## 🖼️ Screenshot

<div align="center">

> *Dark-themed interface with drag & drop config loading, version selection and one-click console launch*

</div>

---

## 🚀 Getting Started

### Prerequisites

- Windows 10 / 11
- .NET Framework 4.x
- Ivanti AM Consoles and/or EM Consoles installed locally

### Installation

1. Download the latest release from the [Releases](https://github.com/sebastianflint/AMConfigVersionSelector/releases) page
2. Extract to a folder, e.g. `C:\Tools\UWMConfigVersionSelector\`
3. Place your console versions in the expected directory structure (see below)
4. Run `UWMConfigVersionSelector.exe`

### Directory Structure

The tool expects your consoles to be organized like this next to the executable:

```
UWMConfigVersionSelector.exe
├── AMConsoles\
│   ├── 10.4.0.0\
│   │   └── AMConsole.exe
│   ├── 10.3.2.0\
│   │   └── AMConsole.exe
│   └── ...
└── EMConsoles\
    ├── 10.17.1.0\
    │   └── EMConsole.exe
    ├── 10.16.0.0\
    │   └── EMConsole.exe
    └── ...
```

> **Folder names must follow the `Major.Minor.Patch.Build` format** (e.g. `10.4.0.0`) — the tool uses these to sort and match versions numerically.

---

## 📖 Usage

### Loading a Configuration

**Option A — Drag & Drop**
Drag any `.aamp` or `.aemp` file onto the drop zone in the UI.

**Option B — Click to Browse**
Click the drop zone to open a file browser dialog.

**Option C — Command Line**
Pass the config path as a command-line argument:
```bash
UWMConfigVersionSelector.exe "C:\Configs\myconfig.aamp"
```

### Opening a Console

Once a config is loaded, the tool automatically:
- Disables the irrelevant console type (`.aamp` → only AM, `.aemp` → only EM)
- Pre-selects the matching console version based on the config's `CreatorVersion`

Click **Open AM Console** or **Open EM Console** to launch.

---

## 🔧 Troubleshooting

### Console crashes with `FileLoadException` on startup

This is a Windows **Zone.Identifier** (Mark of the Web) issue. Files downloaded from the internet or copied from a network location get blocked by .NET's security policy.

**Fix — unblock all DLLs at once via PowerShell:**
```powershell
Get-ChildItem -Path ".\EMConsoles" -Recurse | Unblock-File
Get-ChildItem -Path ".\AMConsoles" -Recurse | Unblock-File
```

Or manually: right-click any blocked `.dll` → Properties → check **Unblock** at the bottom.

Alternatively, add this to `EMConsole.exe.config`:
```xml
<configuration>
  <runtime>
    <loadFromRemoteSources enabled="true"/>
  </runtime>
</configuration>
```

---

## 🏗️ Building from Source

```bash
git clone https://github.com/sebastianflint/AMConfigVersionSelector.git
cd AMConfigVersionSelector
```

Open `UWMConfigVersionSelector.sln` in **Visual Studio 2019 or later** and build with `Ctrl+Shift+B`.

> Requires references to `AppSense.Aom.dll` and `EMConsole` assemblies from your Ivanti installation.

---

## 📋 Changelog

### v3.1 — Current
- Complete UI redesign: modern borderless dark theme
- Drag & drop support directly on the main window
- Colored properties panel with key/value display
- Blinking status indicator on console launch
- Startup focus fix for ComboBox controls
- Unblock-File troubleshooting guidance

### v3.0
- Added EM Console support alongside AM Console
- GitHub release update checker
- System tray integration with context menu

### v2.x
- Initial AM Console version selector
- Basic config file reading via `PackageManager`

---

## 👤 Author

**Sebastian Flint**
📧 sebastian.flint@sva.de
🏢 [SVA GmbH](https://www.sva.de)

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

---

<div align="center">

*Built with ❤️ for Ivanti administrators who deserve better tooling*

</div>
