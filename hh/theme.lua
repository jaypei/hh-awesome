--
-- Author: jaypei <jaypei97159@gmail.com>
-- github.com/jaypei/hh-awesome
--

local config       = require("etc/config")
local client       = client
local screen       = screen
local dotfile_dir  = os.getenv("HOME") .. "/.config/awesome/"
local gears        = require("gears")
local beautiful    = require("beautiful")
local theme        = "steamburn"
local util         = require("hh.util")
local naughty      = require("naughty")

module("hh.theme")

local custom_wallpaper = config.hh_dotfile_dir .. "/awesome/wall.png"

-- beautiful init
beautiful.init(dotfile_dir .. "themes/" .. theme .. "/theme.lua")

-- wallpaper
if util.file_exists(custom_wallpaper) then
  beautiful.wallpaper = custom_wallpaper
end

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

-- No border for maximized clients
client.connect_signal("focus",
    function(c)
        if c.maximized_horizontal == true and c.maximized_vertical == true then
            c.border_color = beautiful.border_normal
        else
            c.border_color = beautiful.border_focus
        end
    end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- naughty
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
