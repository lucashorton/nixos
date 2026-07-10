{ lib, ... }: {
  wayland.windowManager.hyprland = {
    enable = true; # enable Hyprland
    package = null;
    portalPackage = null;
    systemd.enable = false;
    settings = {
      mod = {
        _var = "SUPER";
      };
      monitor = [
        {
          output = "DP-2";
          mode = "3840x2160@60";
          position = "0x0";
          scale = "1.6";
          bitdepth = 10;
	  disabled = 1;
        }
        {
          output = "HDMI-A-1";
          mode = "3840x2160@60";
          position = "0x0";
          scale = "1.6";
          bitdepth = 10;
        }
        {
          output = "eDP-1";
          mode = "3840x2160@120";
          position = "2880x0";
          scale = "1.6";
          bitdepth = 10;
        }
      ];
      workspace_rule = {
        workspace = "1";
        monitor = "HDMI-A-1";
        default = true;
      };
      config = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          col = {
            active_border = "#9ccfd8";
            inactive_border = "#6e6a86";
          };
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
          rounding_power = 2;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "#1a1a1a";
          };
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };

        };
        animations = {
          enabled = true;
        };
        dwindle = {
          preserve_split = true;
        };
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };
        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "ctrl:nocaps";
          kb_rules = "";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = {
            natural_scroll = false;
          };
        };
      };
      gesture = {
        fingers = 3;
        direction = "horizontal";
        action = "workspace";
      };
      bind = [
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + C\"")
            (lib.generators.mkLuaInline "hl.dsp.window.close()")
            { locked = true; }
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + mouse:272\"")
            (lib.generators.mkLuaInline "hl.dsp.window.drag()")
            { locked = true; }
          ];
	}
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + Q\"")
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ghostty\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + RETURN\"")
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ghostty\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + M\"")
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + R\"")
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wofi --show drun\")")
          ];
        }
        {
          _args = [
            "ALT + R"
            (lib.generators.mkLuaInline "hl.dsp.submap(\"resize\")")

          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + V\"")
            (lib.generators.mkLuaInline "hl.dsp.window.float({action=\"toggle\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + P\"")
            (lib.generators.mkLuaInline "hl.dsp.window.pseudo()")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + S\"")
            (lib.generators.mkLuaInline "hl.dsp.layout(\"togglesplit\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + left\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"left\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + right\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"right\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + up\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"up\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + down\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"down\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + H\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"left\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + L\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"right\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + K\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"up\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + J\"")
            (lib.generators.mkLuaInline "hl.dsp.focus({direction=\"down\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT + left\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"left\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT + right\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"right\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT + up\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"up\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT+ down\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"down\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT + H\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"left\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT + L\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"right\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT + K\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"up\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + SHIFT + J\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({direction=\"down\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "\"switch:on:Lid Switch\"")
            (lib.generators.mkLuaInline "function()\n  hl.monitor({output=\"eDP-1\", disabled = true})\nend")
            { locked = true; }
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "\"switch:off:Lid Switch\"")
            (lib.generators.mkLuaInline "function()\n  hl.monitor({output=\"eDP-1\", disabled = false})\nend")
            { locked = true; }
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "\"XF86AudioRaiseVolume\"")
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "\"XF86AudioLowerVolume\"")
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "\"XF86AudioMute\"")
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")")
          ];
        }
      ];

      define_submap = {
        _args = [
          "resize"
          (lib.generators.mkLuaInline "function()\n  hl.bind(\"right\", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"left\", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"escape\", hl.dsp.submap(\"reset\"))\nend")
        ];
      };

    };
    extraConfig = ''
           for i = 1, 10 do
              local key = i % 10 -- 10 maps to key 0
              hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
              hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
           end
           -- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
      hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
      hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
      hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
      hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
      hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

      -- Default springs
      hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

      hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
      hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
      hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
      hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
      hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
      hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
      hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
      hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
      hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
      hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
      hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
      hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
      hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
      hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
    '';
  };
}
