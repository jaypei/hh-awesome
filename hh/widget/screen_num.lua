local awful     = require("awful")
local lain      = require("lain")
local markup    = require("hh.widget.markup").markup
local wibox     = require("wibox")
local beautiful = require("beautiful")

local result = {}

for s = 1, screen.count() do
  txt = "[SC:" .. s .. "]"
  result[s] = {}
  result[s].widget = awful.widget.watch({
      timeout  = 60,
      cmd = "date +'%A %Y-%m-%d %R'",
      settings = function()
        local t_output = ""
        local o_it = string.gmatch(output, "%S+")

        for i=1,2 do t_output = t_output .. " " .. o_it(i) end

        widget:set_markup(
          markup("#7788af", "S")
            .. markup("#de5e1e", s)
            .. " ")
      end
  })
end

return result
