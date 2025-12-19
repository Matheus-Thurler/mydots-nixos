{ pkgs, ... }:

{
  # GTK Theme Configuration (Thunar, etc.)
  gtk = {
    enable = true;
    
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };

    font = {
      name = "Ubuntu Nerd Font";
      size = 11;
    };
  };
  
  # Qt Theme Styling (to match GTK)
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };
  
  # Force Theme for some apps that ignore Xsettings
  home.sessionVariables = {
    GTK_THEME = "Tokyonight-Dark";
  };
  
  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
