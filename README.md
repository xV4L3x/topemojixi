
# 🎯 TopEmojiXI

### Pin any emoji or text to your Lock Screen — exactly where you want it.

[![Platform](https://img.shields.io/badge/platform-iOS%2011+-black?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/xV4L3x/topemojixi)
[![Theos](https://img.shields.io/badge/built%20with-Theos-blueviolet?style=for-the-badge)](https://theos.dev)
[![Downloads](https://img.shields.io/badge/downloads-8,680-blue?style=for-the-badge&logo=cydia&logoColor=white)](https://www.ios-repo-updates.com/repository/bigboss/)
[![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)](LICENSE)

*A lightweight jailbreak tweak that lets you overlay custom emojis or text on your Lock Screen with pixel-perfect absolute positioning.*

---

## ✨ Features

| Feature | Description |
|---|---|
| 🎨 **Custom Content** | Type any emoji, symbol, or text string — it's your Lock Screen canvas |
| 📐 **Absolute Positioning** | Set precise **X** and **Y** coordinates to place your content pixel-perfectly |
| ⚡ **Live Preferences** | Changes apply instantly via Darwin notifications — no respring needed for text/position updates |
| 🔀 **Toggle On/Off** | Enable or disable the overlay with a single switch from Settings |
| 🔄 **One-Tap Respring** | Built-in respring button for a clean restart whenever you need it |
| 🪶 **Ultra Lightweight** | Hooks a *single* SpringBoard class — virtually zero performance overhead |

---

## 📸 How It Works

TopEmojiXI hooks into `SBLockScreenViewControllerBase` and injects a `UILabel` overlay onto the Lock Screen view. You configure everything from a dedicated **Settings panel** inside the iOS Preferences app:

1. **Type your content** — emoji, text, or a mix of both  
2. **Set X / Y coordinates** — fine-tune exactly where it appears (leave blank for center)  
3. **Toggle the switch** — show or hide instantly  

> The label renders in **Arial Rounded MT Bold** at **35pt**, white text, center-aligned — designed to stand out beautifully on any wallpaper.

---

## 📦 Installation

### Prerequisites

- A **jailbroken** iOS 11+ device  
- **Theos** build environment ([setup guide](https://theos.dev/docs/installation))

### Build & Install

```bash
# Clone the repo
git clone https://github.com/xV4L3x/topemojixi.git
cd topemojixi

# Build and deploy to your device
make package install THEOS_DEVICE_IP=<YOUR_DEVICE_IP>
```

> After installation, SpringBoard will automatically restart and the **TopEmojiXI** preference pane will appear in your Settings app.

### From `.deb`

A pre-built `.deb` package is available in the `packages/` directory. Transfer it to your device and install with your preferred package manager (e.g., Filza, dpkg).

```bash
dpkg -i com.xvalex.topemojixi_0.0.1-83+debug_iphoneos-arm.deb
```

---

## ⚙️ Configuration

Navigate to **Settings → TopEmojiXI** on your device:

| Setting | Description |
|---|---|
| **Enabled** | Master toggle — turn the overlay on or off |
| **Text** | The emoji or text string to display |
| **X** | Horizontal position (in points from the left edge) |
| **Y** | Vertical position (in points from the top edge) |
| **Close Keyboard** | Dismiss the keyboard after editing values |
| **Respring** | Restart SpringBoard to apply a fresh state |

> **Tip:** Leave X and Y blank to default to centered positioning. Perfect for a quick setup!

---



## 🔧 Technical Details

- **Hook Target:** `SBLockScreenViewControllerBase` → `viewDidLoad`
- **Overlay:** `UILabel` added as a subview to the Lock Screen view controller
- **Preferences:** Stored in `/var/mobile/Library/Preferences/com.xvalex.topemojixi.plist`
- **Live Reload:** Darwin notification `com.xvalex.topemojixi/settingschanged` triggers instant preference reloading
- **Dependencies:** `mobilesubstrate`

---

## 🤝 Contributing

Contributions, ideas, and bug reports are welcome! Feel free to:

1. **Fork** the repository  
2. Create a **feature branch** (`git checkout -b feature/amazing-feature`)  
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)  
4. **Push** to the branch (`git push origin feature/amazing-feature`)  
5. Open a **Pull Request**