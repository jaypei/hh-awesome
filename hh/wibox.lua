local beautiful    = require("beautiful")
local wibox        = require("wibox")
local awful        = require("awful")
local lain         = require("lain")
local gray         = "#94928F"
local tag          = require("hh.tag")

-- wibox
local markup = lain.util.markup
local gray   = "#94928F"

local hh_layoutbox = require("hh.widget.layoutbox")
local hh_tasklist = require("hh.widget.tasklist")

-- Textclock
local mytextclock = require("hh.widget.clock")

-- CPU
local cpuwidget = lain.widgets.sysload({
    settings = function()
      widget:set_markup(markup(gray, " Cpu ") .. load_1 .. " ")
    end
})

-- -- MEM
-- memwidget = lain.widgets.mem({
--     settings = function()
--         widget:set_markup(markup(gray, " Mem ") .. mem_now.used .. " ")
--     end
-- })

-- -- Battery
-- batwidget = lain.widgets.bat({
--     settings = function()
--         bat_perc = bat_now.perc
--         if bat_perc == "N/A" then bat_perc = "Plug" end
--         widget:set_markup(markup(gray, " Bat ") .. bat_perc .. " ")
--     end
-- })

-- -- Net checker
-- netwidget = lain.widgets.net({
--     settings = function()
--         if net_now.state == "up" then net_state = "On"
--         else net_state = "Off" end
--         widget:set_markup(markup(gray, " Net ") .. net_state .. " ")
--     end
-- })

-- -- ALSA volume
-- volumewidget = lain.widgets.alsa({
--     settings = function()
--         header = " Vol "
--         vlevel  = volume_now.level

--         if volume_now.status == "off" then
--             vlevel = vlevel .. "M "
--         else
--             vlevel = vlevel .. " "
--         end

--         widget:set_markup(markup(gray, header) .. vlevel)
--     end
-- })

-- -- Weather
-- myweather = lain.widgets.weather({
--     city_id = 123456 -- placeholder
-- })

-- -- Separators
-- first = wibox.widget.textbox(markup.font("Tamsyn 4", " "))
-- spr = wibox.widget.textbox(' ')

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
mypromptbox = {}

for s = 1, screen.count() do

    -- TOP
    my_top_wibox[s] = awful.wibox({ position = "top", screen = s, height = 18 })
    local layout = wibox.layout.align.horizontal()
    local left_layout = wibox.layout.fixed.horizontal()
    local right_layout = wibox.layout.fixed.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)
    my_top_wibox[s]:set_widget(layout)
    -- TOP:LEFT
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
    left_layout:add(mytaglist[s])

    -- TOP:RIGHT
    if s == 1 then
      right_layout:add(wibox.widget.systray())
    end
    right_layout:add(mytextclock.widget)

    -- BOTTOM
    my_bot_wibox[s] = awful.wibox({ position = "bottom", screen = s, height = 18 })
    local layout = wibox.layout.align.horizontal()
    my_bot_wibox[s]:set_widget(layout)
    -- BOTTOM:MIDDLE
    layout:set_middle(hh_tasklist[s].widget)
    -- BOTTOM:RIGHT
    layout:set_right(hh_layoutbox[s].widget)
end

