--
-- Author: jaypei <jaypei97159@gmail.com>
-- github.com/jaypei/hh-awesome
--

local client       = client
local screen       = screen
local dotfile_dir  = os.getenv("HOME") .. "/.config/awesome/"
local gears        = require("gears")
local beautiful    = require("beautiful")
local theme        = "steamburn"

module("hh.theme")

-- beautiful init
beautiful.init(dotfile_dir .. "themes/" .. theme .. "/theme.lua")

-- wallpaper
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
