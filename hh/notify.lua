local awesome = awesome
local screen  = screen
local naughty = require("naughty")
local beautiful = require("beautiful")

module("hh.notify")

-- naughty config
-- naughty.config.defaults.screen = config.main_screen
naughty.config.padding                       = 10
naughty.config.spacing                       = 0
naughty.config.defaults.timeout              = 0
naughty.config.defaults.position             = "top_right"

naughty.config.defaults.font                 = beautiful.naughty_font
naughty.config.defaults.fg                   = beautiful.naughty_defaults_fg
naughty.config.defaults.bg                   = beautiful.naughty_defaults_bg
naughty.config.defaults.border_color         = beautiful.naughty_defaults_border_color
naughty.config.defaults.border_width         = beautiful.naughty_border_width

naughty.config.presets.critical.font         = beautiful.naughty_font
naughty.config.presets.critical.fg           = beautiful.naughty_critical_fg
naughty.config.presets.critical.bg           = beautiful.naughty_critical_bg
naughty.config.presets.critical.border_color = beautiful.naughty_critical_border_color
naughty.config.presets.critical.border_width = beautiful.naughty_border_width


function info (title, text)
  local scount = screen.count()
  for i = 1, scount do
    naughty.notify({ preset = naughty.config.presets.info,
                     title = title,
                     text = text,
                     screen = i})
  end
end

function critical (title, text)
  local scount = screen.count()
  for i = 1, scount do
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = title,
                     text = text,
                     screen = i})
  end
end

function setup_runtime_errors_handler ()
  -- Check if awesome encountered an error during startup and fell back to
  -- another config (This code will only ever execute for the fallback config)
  if awesome.startup_errors then
    critical("Oops, there were errors during startup!",
             awesome.startup_errors)
  end

  -- Handle runtime errors after startup
  do
    local in_error = false
    awesome.connect_signal(
      "debug::error",
      function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then
          return
        end
        in_error = true

        critical("Oops, an error happened!",
                 err)
        in_error = false
      end
    )
  end
end
