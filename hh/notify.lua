local awesome = awesome
local screen  = screen
local naughty = require("naughty")
local util    = require("hh.util")

local _M = util.make_module()

-- naughty config
-- naughty.config.defaults.screen = config.main_screen
naughty.config.padding                       = 10
naughty.config.spacing                       = 1
naughty.config.defaults.margin               = 10
naughty.config.defaults.timeout              = 5
naughty.config.defaults.position             = "top_right"

function _M.info (title, text)
  local scount = screen.count()
  for i = 1, scount do
    naughty.notify({
      preset = naughty.config.presets.info,
      title = title,
      text = text,
      screen = i
    })
  end
end

function _M.critical (title, text)
  local scount = screen.count()
  for i = 1, scount do
    naughty.notify({
      preset = naughty.config.presets.critical,
      title = title,
      text = text,
      screen = i
    })
  end
end

function _M.setup_runtime_errors_handler ()
  -- Check if awesome encountered an error during startup and fell back to
  -- another config (This code will only ever execute for the fallback config)
  if awesome.startup_errors then
    critical("Oops, there were errors during startup!", awesome.startup_errors)
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

        _M.critical("Oops, an error happened!", err)
        in_error = false
      end
    )
  end
end


return _M