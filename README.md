# MyDots NixOS ❄️

A modern, aesthetic, and functional **Hyprland** configuration for **NixOS**.
Featuring a consistent **Tokyo Night** theme across all components, advanced workflow scripts, and a robust "infrastructure-as-code" setup using Home Manager and Flakes.

![Screenshot](https://github.com/user-attachments/assets/placeholder.png)

## ✨ Features

*   **Window Manager**: [Hyprland](https://hyprland.org) (Dwindle Layout)
*   **Bar**: [Waybar](https://github.com/Alexays/Waybar) with custom "Tokyo Night" styling and interactive modules.
*   **Notifications**: [SwayNotificationCenter (SwayNC)](https://github.com/ErikReider/SwayNotificationCenter) with History and DND support.
*   **Launcher**: [Rofi](https://github.com/davatorium/rofi) (Wayland fork) with custom scripts for Audio and Bluetooth.
*   **Lock Screen**: [Hyprlock](https://github.com/hyprwm/hyprlock) with blurred screenshot background.
*   **Power Menu**: [Wlogout](https://github.com/ArtsyMacaw/wlogout).
*   **Theme**: Tokyo Night (Global GTK, Icons, Kitty, Rofi, Waybar, Dunst/SwayNC).

## 🚀 Installation (Fresh Install)

To apply this configuration on a fresh NixOS installation:

1.  **Enable Flakes**:
    Ensure your current `/etc/nixos/configuration.nix` has `nix.settings.experimental-features = [ "nix-command" "flakes" ];`.

2.  **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/mydots-nixos.git ~/mydots-nixos
    cd ~/mydots-nixos
    ```

3.  **Apply Configuration**:
    ```bash
    # For a fresh install (replacing hardware-configuration.nix if needed)
    sudo nixos-rebuild switch --flake .
    ```

4.  **Reboot**:
    Reboot to log into your new Hyprland session.

## ⌨️ Keybindings

| Key Combination | Action |
| :--- | :--- |
| `Super + Enter` | Open Terminal (Kitty) |
| `Super + Q` | Close Window |
| `Super + R` | Application Launcher (Rofi) |
| `Super + E` | File Manager (Thunar) |
| `Super + \` | Toggle Quake/Dropdown Terminal |
| `Super + F` | Toggle Fullscreen |
| `Super + V` | Toggle Floating |
| `Super + L` | Lock Screen |
| `Super + Shift + S` | Screenshot (Region -> Clipboard) |
| `Super + Shift + W` | Wallpaper Selector |
| `Super + [1-9]` | Switch Workspace |
| `Super + Shift + [1-9]` | Move Window to Workspace |

## 🛠️ Custom Scripts

This config includes custom scripts integrated into the environment:

*   **Audio Selector**: Click the Volume icon in Waybar or run `rofi-audio`.
*   **Bluetooth Menu**: Click the Bluetooth icon in Waybar or run `rofi-bluetooth`.
*   **Wallpaper Picker**: Press `Super+Shift+W` to select a wallpaper from `~/Pictures/Wallpapers`.

## 📂 Structure

*   `flake.nix`: Entry point.
*   `home.nix`: Home Manager configuration (User packages, visual settings).
*   `modules/user/`: Modularized configurations.
    *   `hyprland/`: Main WM config (binds, rules, execs).
    *   `waybar/`: Status bar config and styling.
    *   `swaync/`: Notification center.
    *   `rofi/`: Menus and scripts.
    *   `hyprlock/`: Lock screen.

## 📝 License

MIT
s