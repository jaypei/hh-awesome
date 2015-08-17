local awful     = require("awful")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local wibox     = require("wibox")
local beautiful = require("beautiful")

-- Battery
baticon = wibox.widget.imagebox(beautiful.widget_batt)
batwidget = lain.widgets.bat({
    settings = function()
        if bat_now.perc == "N/A" then
            perc = "AC "
        else
            perc = bat_now.perc .. "% "
        end
        widget:set_text(perc)
    end
})

return {
  icon = baticon,
  widget = batwidget
}
