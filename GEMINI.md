# GEMINI.md - NixOS Modern Dots (Noctalia v4)

This repository contains the NixOS and Home Manager configuration for **Matheus Thurler**, focusing on a modern desktop experience using **Noctalia Shell v4** and **Hyprland**.

## 🚀 Project Overview

- **Architecture:** NixOS Flakes with integrated Home Manager.
- **Main Shell/UI:** [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) (v4) running on **Hyprland**.
- **Base System:** NixOS Unstable (as defined in `flake.nix`).
- **User:** `matheus`.
- **Hostname:** `nixos`.

## 🛠️ Core Technologies

- **NixOS Flakes:** For reproducible system builds.
- **Home Manager:** For managing user-specific configurations and dotfiles.
- **Window Manager:** Hyprland (with Wayland).
- **Desktop Environment:** GNOME (GDM enabled as the display manager).
- **Shell:** Fish with Starship prompt.
- **Graphics:** NVIDIA (specific configuration in `modules/nixos/nvidia`).
- **Locale:** `en_US.UTF-8` with Brazilian (`pt_BR`) formatting for time, currency, etc. Keyboard layout is `br` (ABNT2).

## 📂 Repository Structure

- `flake.nix`: Central entry point for the configuration. Defines inputs (nixpkgs, home-manager, noctalia) and system outputs.
- `configuration.nix`: System-wide settings (bootloader, networking, users, system packages, services).
- `home.nix`: User-level entry point for Home Manager.
- `hardware-configuration.nix`: Hardware-specific scan results.
- `modules/`:
    - `nixos/`: System-level modules.
        - `nvidia/`: NVIDIA driver and environment setup.
    - `home/`: User-level modules.
        - `noctalia/`: Comprehensive Noctalia Shell customization (colors, settings, widgets, etc.).
        - `hyprland/`: Hyprland configuration, including monitor settings, keybindings, and NVIDIA tweaks.
        - `shell/`: Fish shell and Starship configuration.
        - `packages/`: User-specific package declarations.

## 🔄 Building and Applying Changes

To apply changes made to the configuration:

```bash
sudo nixos-rebuild switch --flake . --impure
```

*Note: The `--impure` flag is used because some configurations might depend on system state or external inputs not fully captured in the flake.*

## ⌨️ Development Conventions

- **Modularization:** Keep configurations modular. Prefer adding new modules in `modules/home/` or `modules/nixos/` and importing them in `home.nix` or `configuration.nix`.
- **Hyprland Bindings:** Keybindings are defined in `modules/home/hyprland/default.nix`.
- **Noctalia Overrides:** Local customization of the Noctalia Shell is handled in `modules/home/noctalia/`.
- **NVIDIA:** Always ensure hardware-specific tweaks (like `no_hardware_cursors`) are maintained for Hyprland stability.

## 📝 Key Files to Watch

- `home.nix`: The primary file for changing user experience.
- `modules/home/noctalia/settings.nix`: Configuration for the Noctalia Shell interface.
- `modules/home/hyprland/default.nix`: Window manager behavior and shortcuts.
