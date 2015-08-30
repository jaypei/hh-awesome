
local screen  = screen
local awful   = require("awful")
awful.layout  = require("awful.layout")
awful.tag     = require("awful.tag")
local ipairs  = ipairs
local lain    = require("lain")
local config  = require("etc/config")
-- local exz_layout_coding = require("exz.layout.coding")
-- local exz_layout_chrome = require("exz.layout.chrome")

module("hh.tag")

-- lain
lain.layout.termfair.nmaster = 2
lain.layout.termfair.ncol    = 1

-- Window management layouts
layouts = {
  awful.layout.suit.floating,         -- 1 
  lain.layout.uselessfair.horizontal, -- 2
  lain.layout.uselesstile,            -- 3
  lain.layout.uselessfair,            -- 4
  lain.layout.termfair,               -- 5
  lain.layout.uselesspiral.dwindle,   -- 6
  exz_layout_chrome                   -- 7
}

tags = {
  names  = { "1:TERM", "2:TERM", "3:CODE",
             "4:DOC", "5:QTALK", "6:FILE",
             "7:VM", "8:MAIL", "9:WEB" },
  layout = { layouts[3], layouts[3], layouts[3],
             layouts[2], layouts[2], layouts[4],
             layouts[3], layouts[3], layouts[2] }
}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
  awful.screen.padding(screen[s], config.screen_padding)
end
