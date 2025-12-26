{ pkgs, ... }:

{
  services.swaync = {
    enable = false;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "user";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-window-width = 400;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "dnd"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
      };
    };
    style = ''
      /* Tokyo Night Theme for SwayNC */
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }

      .control-center {
        background: rgba(26, 27, 38, 0.95);
        border: 2px solid #7aa2f7;
        border-radius: 12px;
        color: #c0caf5;
        padding: 10px;
      }

      .notification {
        background: #24283b;
        border-radius: 8px;
        border: 1px solid #414868;
        margin: 6px 0px;
      }

      .notification-content {
        padding: 10px;
      }

      .notification-default-action {
        margin: 0;
        padding: 0;
        border-radius: 8px;
      }

      .close-button {
        background: #f7768e;
        color: #1a1b26;
        text-shadow: none;
        padding: 0;
        border-radius: 100%;
        margin-top: 5px;
        margin-right: 5px;
      }

      .close-button:hover {
        background: #ff9e64;
      }

      .widget-title {
        color: #7aa2f7;
        background: #24283b;
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        font-size: 1.5rem;
        border-radius: 8px;
      }

      .widget-title > button {
        font-size: 1rem;
        color: #c0caf5;
        text-shadow: none;
        background: #414868;
        border: none;
        box-shadow: none;
        border-radius: 6px;
      }

      .widget-title > button:hover {
        background: #f7768e;
        color: #1a1b26;
      }

      .widget-dnd {
        background: #24283b;
        padding: 5px 10px;
        margin: 5px 10px 10px 10px;
        border-radius: 8px;
        font-size: 1.1rem;
        color: #c0caf5;
      }

      .widget-dnd > switch {
        border-radius: 8px;
        background: #414868;
      }

      .widget-dnd > switch:checked {
        background: #7aa2f7;
      }
    '';
  };
}
