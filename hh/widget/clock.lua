local awful     = require("awful")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local wibox     = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local clockicon = wibox.widget.imagebox(beautiful.widget_clock)
local mytextclock = awful.widget.watch(
    "date +'%Y-%m-%d %R %A'",
    60,
    function(widget, stdout)
        widget:set_markup(markup.font(theme.font, stdout))
    end
)

-- mytextclock = awful.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#343639", ">") .. markup("#de5e1e", " %H:%M "))
--mytextclock = awful.widget.watch({
--    timeout  = 60,
--    cmd = "date +'%A %Y-%m-%d %R'",
--    settings = function()
--        local t_output = ""
--        local o_it = string.gmatch(output, "%S+")
--
--        for i=1,2 do t_output = t_output .. " " .. o_it(i) end
--
--        widget:set_markup(markup("#7788af", t_output) .. " " .. markup("#de5e1e", o_it(1)) .. " ")
--    end
--})

-- Calendar
local cal = lain.widget.calendar({
    attach_to = { mytextclock },
    notification_preset = {
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

return {
  icon = clockicon,
  widget = mytextclock
}
