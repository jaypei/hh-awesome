
local screen  = screen
local awful   = require("awful")
awful.layout  = require("awful.layout")
awful.tag     = require("awful.tag")
local ipairs  = ipairs
local lain    = require("lain")
local config  = require("etc/config")

module("hh.tag")

-- lain
lain.layout.termfair.nmaster = 2
lain.layout.termfair.ncol    = 1

-- Window management layouts
layouts = {
  awful.layout.suit.floating,        -- 1
  lain.layout.uselesstile.left,      -- 2
  lain.layout.uselesstile.right,     -- 3
  lain.layout.uselesstile.top,       -- 4
  lain.layout.uselesstile.bottom,    -- 5
}

tags = {
  names  = { "1:WS", "2:WS", "3:WS", "4:WS",
             "5:DOC", "6:IM", "7:SCHED", "8:MAIL", "9:WEB"},
  layout = { layouts[2], layouts[2], layouts[3], layouts[2],
             layouts[2], layouts[1], layouts[3], layouts[3], layouts[2] }
}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
  awful.screen.padding(screen[s], config.screen_padding)
end
