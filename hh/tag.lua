local screen  = screen
local print   = print
local awful   = require("awful")
awful.layout  = require("awful.layout")
awful.tag     = require("awful.tag")
local ipairs  = ipairs
local lain    = require("lain")
local config  = require("etc/config")
local hh_layout = require("hh/layout")

module("hh.tag")

-- Window management layouts
layouts = {
  awful.layout.suit.floating,		-- 1
  hh_layout.uselessfair.vertical,	-- 2
  hh_layout.uselessfair.horizontal,	-- 3
  hh_layout.uselesstile.right,		-- 4
}

l_tags = {
  names  = { "1:WS", "2:WS", "3:WS", "4:WS",
             "5:DOC", "6:IM", "7:SCHED", "8:MAIL", "9:WEB"},
  layout = { layouts[2], layouts[2], layouts[2], layouts[2],
             layouts[2], layouts[2], layouts[2], layouts[2], layouts[2] }
}

tags = {}

for s = 1, screen.count() do
  tags[s] = awful.tag(l_tags.names, s, l_tags.layout)
  screen[s].padding = config.screen_padding
end
