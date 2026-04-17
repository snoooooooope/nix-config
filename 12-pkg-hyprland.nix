{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		fuzzel
		wl-clipboard
		rose-pine-hyprcursor
	];
	
	environment.sessionVariables = {
	    NIXOS_OZONE_WL = "1";
	    HYPRLAND_CONFIG = "/etc/hypr/hyprland.conf";
	};
	programs.hyprland.enable = true;

  environment.etc."hypr/hyprland.conf".text = ''
    # MONITORS
    monitor=,preferred,auto,auto

    # MY PROGRAMS
    $terminal = foot
    $fileManager = dolphin
    $menu = fuzzel

    # ENVIRONMENT VARIABLES
    env = XCURSOR_SIZE,24
    env = HYPRCURSOR_SIZE,24
    env = HYPRCURSOR_THEME,rose-pine-hyprcursor

    # LOOK AND FEEL
    general {
        gaps_in = 2
        gaps_out = 2
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
        resize_on_border = false
        allow_tearing = false
        layout = dwindle
    }

    decoration {
        rounding = 0
        shadow {
            enabled = false
        }
        blur {
            enabled = false
        }
    }

    animations {
        enabled = no
    }

    # SMART GAPS
    workspace = w[tv1], gapsout:0, gapsin:0
    workspace = f[1], gapsout:0, gapsin:0
    windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
    windowrule = rounding 0, floating:0, onworkspace:w[tv1]
    windowrule = bordersize 0, floating:0, onworkspace:f[1]
    windowrule = rounding 0, floating:0, onworkspace:f[1]

    dwindle {
        pseudotile = true
        preserve_split = true
    }

    misc {
        force_default_wallpaper = 0
        disable_hyprland_logo = false
    }

    # INPUT
    input {
        kb_layout = us
        force_no_accel = true
        accel_profile = flat
        follow_mouse = 1
        sensitivity = 0
        touchpad {
            natural_scroll = false
        }
    }

    # KEYBINDINGS
    $mainMod = SUPER

    bind = $mainMod, RETURN, exec, $terminal
    bind = $mainMod, Q, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, D, exec, $menu
    bind = $mainMod, P, pseudo,
    bind = $mainMod, J, togglesplit,

    # Focus
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Workspaces
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to workspace
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Multimedia Keys
    bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
    bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
    bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

    # WINDOW RULES
    windowrule = suppressevent maximize, class:.*
    windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
  '';
}
