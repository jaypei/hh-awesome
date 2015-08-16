local awful   = require("awful")
awful.menu    = require("awful.menu")
local menugen = require("menugen")

module("hh.menu")

main = awful.menu.new({
    items = menugen.build_menu(),
    theme = { height = 16, width = 130 }})
