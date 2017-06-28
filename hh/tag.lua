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
  names  = { "1:C", "2:C", "3:C", "4:W",
             "5:P", "6", "7:VM", "8:MAIL", "9:WWW"},
  layout = { layouts[2], layouts[2], layouts[2], layouts[1],
             layouts[1], layouts[1], layouts[2], layouts[2], layouts[2] }
}

tags = {}

for s = 1, screen.count() do
  tags[s] = awful.tag(l_tags.names, s, l_tags.layout)
  screen[s].padding = config.screen_padding
end
