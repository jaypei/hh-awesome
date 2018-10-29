require("awful.layout")
require("awful.tag")

local G             = _G
local client        = client
local mouse         = mouse
local awesome       = awesome
local root          = root
local screen        = screen
local awful         = require("awful")
local config        = require("etc/config")
local util          = require("hh.util")
local cyclefocus    = require("cyclefocus")
local menu          = require("hh.menu")
local hh_tag        = require("hh.tag")
local hh_wibox      = require("hh.wibox")
local scratch       = require("scratch")

local modkey  = config.modkey
local altkey  = config.altkey
local exec    = util.exec
local gexec   = util.gexec
local sexec   = util.sexec

--module("hh.keys")

--------------------------------------------------
-- key-maps
--------------------------------------------------
global_keys = util.KeyMap:new()
global_client_keys = util.KeyMap:new()

--------------------------------------------------
-- Mouse buttons
--------------------------------------------------
global_keys:def_btn({}, 3, function () menu.main:toggle() end)

--------------------------------------------------
-- key-bindings about tag
--------------------------------------------------
global_keys:def_key({ modkey }, "Escape", awful.tag.history.restore)
global_keys:def_key({ modkey }, "`", awful.tag.history.restore)

for i = 1, 9 do
  -- switch tag
  global_keys:def_key({ modkey }, "#" .. i+9, function ()
      if config.sync_select_ws then
        for s in screen do
          local tag = s.tags[i]
          if tag then
            tag:view_only()
          end
        end
      else
        local lscreen = mouse.screen
        local tag = lscreen.tags[i]
        if tag then
          tag:view_only()
        end
      end
  end)
  -- Toggle tag
  global_keys:def_key({ modkey, "Control" }, "#" .. i+9, function ()
      if config.sync_select_ws then
        for s in screen do
          local tag = s.tags[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end
      else
        local lscreen = mouse.screen
        local tag = lscreen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end
  end)
  -- Move client to tag
  global_keys:def_key({ modkey, "Shift" }, "#" .. i+9, function ()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          awful.client.movetotag(tag)
        end
      end
  end)
  -- clone tag
  global_keys:def_key({ modkey, "Control", "Shift" }, "#" .. i+9,
    function ()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          awful.client.toggletag(tag)
        end
      end
  end)
end

--------------------------------------------------
-- Layout switch & manipulation
--------------------------------------------------
cyclefocus.key({ "Mod1", }, "Tab", 1, {
    cycle_filters = { cyclefocus.filters.same_screen,
                      cyclefocus.filters.common_tag },
    keys = {'Tab', 'ISO_Left_Tab'}
})

global_keys:def_key({ modkey,           }, "n", function ()
    awful.client.focus.byidx( 1) if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey,           }, "p", function ()
    awful.client.focus.byidx(-1) if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey,           }, "h", function ()
    awful.client.focus.bydirection("left") if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey,           }, "l", function ()
    awful.client.focus.bydirection("right") if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey,           }, "j", function ()
    awful.client.focus.bydirection("down") if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey,           }, "k", function ()
    awful.client.focus.bydirection("up") if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey, "Shift"   }, "n", function ()
    awful.client.swap.byidx(  1)
end)
global_keys:def_key({ modkey, "Shift"   }, "p", function ()
    awful.client.swap.byidx( -1)
end)
global_keys:def_key({ modkey, "Control" }, "n", function ()
    awful.screen.focus_relative( 1)
end)
global_keys:def_key({ modkey, "Control" }, "h", function ()
    awful.screen.focus_relative( 1)
end)
global_keys:def_key({ modkey, "Control" }, "p", function ()
    awful.screen.focus_relative(-1)
end)
global_keys:def_key({ modkey, "Control" }, "l", function ()
    awful.screen.focus_relative(-1)
end)
global_keys:def_key({ modkey,           }, "u", awful.client.urgent.jumpto)
global_keys:def_key({ modkey,           }, "Tab", function ()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
end)
global_keys:def_key({ modkey,           }, "space", function () awful.layout.inc(hh_tag.layouts,  1) end)
global_keys:def_key({ modkey, "Shift"   }, "space", function () awful.layout.inc(hh_tag.layouts, -1) end)


--------------------------------------------------
-- client keys
--------------------------------------------------
global_client_keys:def_key({ modkey            }, "f", function (c) c.fullscreen = not c.fullscreen end)
global_client_keys:def_key({ modkey, "Shift"   }, "c", function (c) c:kill() end)
global_client_keys:def_key({ modkey, "Control" }, "space", awful.client.floating.toggle)
global_client_keys:def_key({ modkey, "Control" }, "Return",
  function (c) c:swap(awful.client.getmaster()) end)
global_client_keys:def_key({ modkey }, "o", function (c)
    c:move_to_screen()
end)
global_client_keys:def_key({ modkey }, "m",
  function (c)
    c.maximized_horizontal = not c.maximized_horizontal
    c.maximized_vertical   = not c.maximized_vertical
end)

global_client_keys:def_btn({ }, 1, function (c) client.focus = c; c:raise() end)
global_client_keys:def_btn({ modkey }, 1, awful.mouse.client.move)
global_client_keys:def_btn({ modkey }, 3, awful.mouse.client.resize)

global_client_keys:def_key({ modkey }, "Right", function () awful.tag.incmwfact( 0.01)    end)
global_client_keys:def_key({ modkey }, "Left",  function () awful.tag.incmwfact(-0.01)    end)
global_client_keys:def_key({ modkey }, "Down",  function (c) awful.client.incwfact( 0.01, c)  end)
global_client_keys:def_key({ modkey }, "Up",    function (c) awful.client.incwfact(-0.01, c)  end)

--------------------------------------------------
-- helpers
--------------------------------------------------
global_keys:def_key({ modkey, "Control" }, "r", awesome.restart)
global_keys:def_key({ modkey }, "w", function ()
    gexec("rofi -show window")
end)
global_keys:def_key({ modkey }, "e", function (c)
    gexec(config.file_explorer)
end)
-- GoldenDict
global_client_keys:def_key({ altkey }, "space", function (c)
    util.clip_translate()
end)
global_client_keys:def_key({ modkey,  }, "t", function (c)
    util.clip_translate()
end)
global_keys:def_key({ modkey }, "q", function () util.lock_screen() end)
global_keys:def_key({ modkey }, "Return", function ()
    exec(config.terminal)
end)
global_keys:def_key({ modkey }, "a", function ()
    sexec("qsnip -s")
end)
global_keys:def_key({ modkey          }, "r", function () util.show_rofi(true) end)
global_keys:def_key({ modkey, "Shift" }, "r", function () util.show_rofi(false) end)
global_keys:def_key({ modkey }, "z", function ()
    scratch.drop(config.terminal, "center", "center", 0.8, 0.8, true)
end)
global_keys:def_key({ modkey }, "s", function ()
    scratch.drop(config.file_explorer, "center", "center", 0.8, 0.8, true)
end)

-- Show/Hide Wibox
global_keys:def_key({ modkey }, "b", function ()
    hh_wibox.my_top_wibox[mouse.screen].visible =
      not hh_wibox.my_top_wibox[mouse.screen].visible
    hh_wibox.my_bot_wibox[mouse.screen].visible =
      not hh_wibox.my_bot_wibox[mouse.screen].visible
end)

return {
    global_keys = global_keys,
    global_client_keys = global_client_keys
}
