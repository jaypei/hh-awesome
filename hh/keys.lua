
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

module("hh.keys")

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

for i = 1, 9 do
  -- switch tag
  global_keys:def_key({ modkey }, "#" .. i+9, function ()
      if config.sync_select_ws then
        for s = 1, screen.count() do
          local tag = awful.tag.gettags(s)[i]
          if tag then
            awful.tag.viewonly(tag)
          end
        end
      else
        local lscreen = mouse.screen
        local tag = awful.tag.gettags(lscreen)[i]
        if tag then
          awful.tag.viewonly(tag)
        end
      end
  end)
  -- Toggle tag
  global_keys:def_key({ modkey, "Control" }, "#" .. i+9, function ()
      if config.sync_select_ws then
        for s = 1, screen.count() do
          local tag = awful.tag.gettags(s)[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end
      else
        local lscreen = mouse.screen
        local tag = awful.tag.gettags(lscreen)[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end
  end)
  -- Move client to tag
  global_keys:def_key({ modkey, "Shift" }, "#" .. i+9, function ()
      if client.focus then
        local tag = awful.tag.gettags(client.focus.screen)[i]
        if tag then
          awful.client.movetotag(tag)
        end
      end
  end)
  -- clone tag
  global_keys:def_key({ modkey, "Control", "Shift" }, "#" .. i+9,
    function ()
      if client.focus then
        local tag = awful.tag.gettags(client.focus.screen)[i]
        if tag then
          awful.client.toggletag(tag)
        end
      end
  end)
end

--------------------------------------------------
-- Layout switch & manipulation
--------------------------------------------------
global_keys:def_key({ modkey }, "n", function ()
    awful.client.focus.byidx( 1)
    if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey }, "j", function ()
    awful.client.focus.byidx( 1)
    if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey }, "p", function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
end)
global_keys:def_key({ modkey }, "k", function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
end)
cyclefocus.key({ "Mod1", }, "Tab", 1, {
    cycle_filters = { cyclefocus.filters.same_screen,
                      cyclefocus.filters.common_tag },
    keys = {'Tab', 'ISO_Left_Tab'}
})

global_keys:def_key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx(  1)    end)
global_keys:def_key({ modkey, "Shift"   }, "p", function () awful.client.swap.byidx( -1)    end)
global_keys:def_key({ modkey, "Control" }, "n", function () awful.screen.focus_relative( 1) end)
global_keys:def_key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end)
global_keys:def_key({ modkey, "Control" }, "p", function () awful.screen.focus_relative(-1) end)
global_keys:def_key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end)
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
global_client_keys:def_key({ modkey }, "o", awful.client.movetoscreen)
global_client_keys:def_key({ modkey }, "t", function (c) c.ontop = not c.ontop end)
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
global_client_keys:def_key({ modkey }, "Down",  function () awful.client.incwfact( 0.01)  end)
global_client_keys:def_key({ modkey }, "Up",    function () awful.client.incwfact(-0.01)  end)

--------------------------------------------------
-- helpers
--------------------------------------------------
global_keys:def_key({ modkey, "Control" }, "r", awesome.restart)
global_keys:def_key({ modkey }, "e", function () util.clip_translate() end)
global_keys:def_key({ modkey }, "q", function () util.lock_screen() end)
global_keys:def_key({ modkey }, "Return", function () exec(config.terminal) end)
global_keys:def_key({ modkey }, "a", function () exec("shutter -s -e") end)
global_keys:def_key({ modkey          }, "r", function () util.show_rofi(true) end)
global_keys:def_key({ modkey, "Shift" }, "r", function () util.show_rofi(false) end)
global_keys:def_key({ modkey }, "w", function () gexec("rofi -show window") end)
global_keys:def_key({ modkey }, "z", function ()
    scratch.drop(config.terminal, "center", "center", 0.8, 0.8, true)
end)
global_keys:def_key({ modkey }, "s", function ()
    scratch.drop(config.file_explorer, "center", "center", 0.8, 0.8, true)
end)

-- Copy to clipboard
-- global_keys:def_key({ modkey }, "c", function () gexec("xsel -p -o | xsel -i -b") end)


--   awful.key({ modkey }, "x", function ()
--       awful.prompt.run({ prompt = "Run Lua code: " },
--         hh_wibox.mypromptbox[mouse.screen].widget,
--         awful.util.eval, nil,
--         awful.util.getdir("cache") .. "/history_eval")
--   end),


-- clientkeys = awful.util.table.join(
--   awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
--   awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
--   awful.key({ modkey            }, "Next",   function () awful.client.moveresize( 20,  20, -40, -40) end),
--   awful.key({ modkey            }, "Prior",  function () awful.client.moveresize(-20, -20,  40,  40) end),
--   awful.key({ modkey            }, "Down",   function () awful.client.moveresize(  0,  20,   0,   0) end),
--   awful.key({ modkey            }, "Up",     function () awful.client.moveresize(  0, -20,   0,   0) end),
--   awful.key({ modkey            }, "Left",   function () awful.client.moveresize(-20,   0,   0,   0) end),
--   awful.key({ modkey            }, "Right",  function () awful.client.moveresize( 20,   0,   0,   0) end),
--   awful.key({ modkey,           }, "m",
--     function (c)
--       c.maximized_horizontal = not c.maximized_horizontal
--       c.maximized_vertical   = not c.maximized_vertical
--   end)
-- )

--   -- Show/Hide Wibox
--   awful.key({ modkey }, "b", function ()
--       mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
--   end),

--   -- User programs
--   awful.key({ modkey }, "q", function () awful.util.spawn(browser) end),
--   awful.key({ modkey }, "i", function () awful.util.spawn(browser2) end),
--   awful.key({ modkey }, "s", function () awful.util.spawn(gui_editor) end),
--   awful.key({ modkey }, "g", function () awful.util.spawn(graphics) end),

--   -- Prompt
--   awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),
--   awful.key({ modkey }, "x",
--     function ()
--       awful.prompt.run({ prompt = "Run Lua code: " },
--         mypromptbox[mouse.screen].widget,
--         awful.util.eval, nil,
--         awful.util.getdir("cache") .. "/history_eval")
--   end),
-- )
