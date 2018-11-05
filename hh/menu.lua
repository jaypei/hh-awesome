local awesome = awesome
local awful   = require("awful")
awful.menu    = require("awful.menu")
local menugen = require("menugen")
local hotkeys_popup = require("awful.hotkeys_popup").widget

module("hh.menu")

main = awful.menu({
    items = {
      { "applications", menugen.build_menu() },
      { "hotkeys", function() return false, hotkeys_popup.show_help end},
      { "restart", awesome.restart },
      { "quit", function() awesome.quit() end}
    },
    theme = { height = 20, width = 130 }})
