local awesome = awesome
local awful   = require("awful")
awful.menu    = require("awful.menu")
local menugen = require("menugen")
local util = require("hh.util")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local _M = util.make_module()

_M.main = awful.menu({
    items = {
      { "applications", menugen.build_menu() },
      { "hotkeys", function() return false, hotkeys_popup.show_help end},
      { "restart", awesome.restart }
      -- { "quit", function() awesome.quit() end}
    },
    theme = { height = 20, width = 130 }})

return _M
