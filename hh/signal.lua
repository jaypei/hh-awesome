local client     = client
local awful      = require("awful")
local wibox      = require("wibox")
local lain_util  = require("lain.util")
local config     = require("etc/config")

module("hh.signal")

function auto_focus_on_mouse_enter(c)
  c:connect_signal("mouse::enter", function(c)
                     if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
                     and awful.client.focus.filter(c) then
                       client.focus = c
                     end
  end)
end

function on_startup(c)
  if not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_overlap(c)
    awful.placement.no_offscreen(c)
  end
end

function setup_titlebar(c)
  if config.enable_titlebar and (c.type == "normal" or c.type == "dialog") then
    local buttons = awful.util.table.join(
      awful.button({ }, 1, function()
          client.focus = c
          c:raise()
          awful.mouse.client.move(c)
      end),
      awful.button({ }, 3, function()
          client.focus = c
          c:raise()
          awful.mouse.client.resize(c)
      end)
    )

    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(awful.titlebar.widget.iconwidget(c))
    left_layout:buttons(buttons)

    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(awful.titlebar.widget.floatingbutton(c))
    right_layout:add(awful.titlebar.widget.maximizedbutton(c))
    right_layout:add(awful.titlebar.widget.stickybutton(c))
    right_layout:add(awful.titlebar.widget.ontopbutton(c))
    right_layout:add(awful.titlebar.widget.closebutton(c))

    local middle_layout = wibox.layout.flex.horizontal()
    local title = awful.titlebar.widget.titlewidget(c)
    title:set_align("left")
    middle_layout:add(title)
    middle_layout:buttons(buttons)

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)
    layout:set_middle(middle_layout)

    awful.titlebar(c, {size=15}):set_widget(layout)
  end
end

client.connect_signal(
  "manage", function (c, startup)
    if not startup then
      on_startup(c)
    end
    --setup_titlebar(c)
end)

client.connect_signal(
  "focus", function (c)
    --lain_util.niceborder_focus(c)
end)

client.connect_signal(
  "unfocus", function (c)
    --lain_util.niceborder_unfocus(c)
end)
