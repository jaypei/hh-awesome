local beautiful    = require("beautiful")
local wibox        = require("wibox")
local awful        = require("awful")
local lain         = require("lain")
local gray         = "#94928F"
local tag          = require("hh.tag")

-- wibox
local markup = lain.util.markup
local gray   = "#94928F"

local hh_layoutbox    = require("hh.widget.layoutbox")
local hh_tasklist     = require("hh.widget.tasklist")
local hh_textclock    = require("hh.widget.clock")
local hh_battery      = require("hh.widget.battery")
local hh_volume       = require("hh.widget.volume")
local hh_screen_num   = require("hh.widget.screen_num")

mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end))


my_top_wibox = {}
my_bot_wibox = {}

for s = 1, screen.count() do

    -- TOP
    my_top_wibox[s] = awful.wibox({
        position = "top", screen = s, height = 18,
        border_width = beautiful.wibox_border_width,
        border_color = beautiful.wibox_border
    })
    local layout = wibox.layout.align.horizontal()
    my_top_wibox[s]:set_widget(layout)

    -- TOP:LEFT
    local left_layout = wibox.layout.fixed.horizontal()
    layout:set_left(left_layout)
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
    left_layout:add(mytaglist[s])

    -- TOP:RIGHT
    local right_layout = wibox.layout.fixed.horizontal()
    layout:set_right(right_layout)
    if s == 1 then
      right_layout:add(wibox.widget.systray())
    end
    right_layout:add(hh_volume.icon)
    right_layout:add(hh_volume.widget)
    right_layout:add(hh_battery.icon)
    right_layout:add(hh_battery.widget)
    right_layout:add(hh_textclock.icon)
    right_layout:add(hh_textclock.widget)

    -- BOTTOM
    my_bot_wibox[s] = awful.wibox({
        position = "bottom", screen = s, height = 18,
        border_width = beautiful.wibox_border_width,
        border_color = beautiful.wibox_border
    })
    local layout = wibox.layout.align.horizontal()
    my_bot_wibox[s]:set_widget(layout)

    -- BOTTOM:LEFT
    local left_layout = wibox.layout.fixed.horizontal()
    layout:set_left(left_layout)

    -- BOTTOM:MIDDLE
    local middle_layout = wibox.layout.fixed.horizontal()
    layout:set_middle(middle_layout)
    middle_layout:add(hh_tasklist[s].widget)

    -- BOTTOM:RIGHT
    local right_layout = wibox.layout.fixed.horizontal()
    layout:set_right(right_layout)
    right_layout:add(hh_screen_num[s].widget)
    right_layout:add(hh_layoutbox[s].widget)
end

return {
  my_top_wibox = my_top_wibox,
  my_bot_wibox = my_bot_wibox
}
