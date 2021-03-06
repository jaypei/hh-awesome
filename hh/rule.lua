--
-- Use xprop to view the window properties
--
-- If you found there are strings in CLASS field,
-- means the first one is INSTANCE, and the last one is CLASS.
--

local screen = screen
local mouse = mouse
local print = print
local config = require("etc/config")
local awful = require("awful")
local beautiful = require("beautiful")
local awful_rules = require("awful.rules")
local awful_placement = require("awful.placement")
local hh_keys   = require("hh.keys")
local hh_tag    = require("hh.tag")

module("hh.rule")
local rules = {}
local scount = screen.count()

function move_client_tag(c, tagidx)
  c:move_to_tag(hh_tag.tags[mouse.screen.index][tagidx])
end

function make_move_client_tag(tagidx)
  local tagidx = tagidx
  function fn(c)
    move_client_tag(c, tagidx)
  end
  return fn
end


awful_rules.rules = {
  -- All clients will match this rule.
  {
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      keys = hh_keys.global_client_keys.keys,
      buttons = hh_keys.global_client_keys.buttons,
      size_hints_honor = false,
      screen = awful.screen.preferred,
      raise = true
    }
  },
  -- urxvt
  -- {
  --   rule = { class = "URxvt" },
  --   properties = { opacity = 0.95 }
  -- },
  -- nemo
  {
    rule = { class = "Nemo", instance = "desktop_window" },
    callback = function (c)
      c.hidden = true
    end
  },
  -- floating
  {
    rule_any = { class = {
                   "desktop_window", "MPlayer", "pinentry", "rdesktop",
                   "netease-cloud-music"
               }},
    properties = { floating = true }
  },
  -- emacs
  {
    rule = { class = "Emacs", instance = "_Remember_" },
    properties = { floating = true }
  },
  -- qtalk
  {
    rule_any = { class = { "QunarIM" } },
    properties = {
      floating = false
    },
    callback = make_move_client_tag(4)
  },
  {
    rule = { class = "QunarIM", name = "SearchResultDialog" },
    properties = {
      floating = true
    }
  },
  {
    rule = { class = "QunarIM", name = "群设置" },
    properties = {
      floating = true
    },
    callback = awful_placement.centered
  },
  {
    rule = { class = "QunarIM", name = "设置" },
    properties = {
      floating = true
    },
    callback = awful_placement.centered
  },
  {
    rule_any = { class = {
                   "electronic-wechat", "netease-cloud-music",
                   "AliWangWang"
               } },
    properties = {
      floating = false,
      border_width = 10
    },
    callback = make_move_client_tag(5)
  },
  {
    rule = { instance = "crx_diankknpkndanachmlckaikddgcehkod" },
    callback = make_move_client_tag(5)
  },
  -- virtualbox
  {
    rule_any = { class = { "VirtualBox", "virt-manager", "Virt-manager", "Spicy" } },
    callback = make_move_client_tag(7)
  },
  {
    rule = { class = "VirtualBox", name = "Oracle VM VirtualBox Manager" },
    properties = { floating = true }
  },
  -- thunderbird
  {
    rule = { class = "Thunderbird" },
    callback = make_move_client_tag(8)
  },
  -- web browser
  {
    rule_any = { class = { "Firefox", "Chromium-browser", "Google-chrome", "google-chrome" } },
    callback = make_move_client_tag(9)
  },
  {
    rule = { class = "Firefox", name = "Youdao translation" },
    properties = { floating = true }
  },
  { rule = { class = "Dwb" },
    callback = make_move_client_tag(9)
  },
  -- dida360
  {
    rule = { instance = "crx_diankknpkndanachmlckaikddgcehkod" },
    callback = make_move_client_tag(5)
  },
  -- Gimp
  {
    rule = { class = "Gimp", role = "gimp-image-window" },
    properties = { maximized_horizontal = true,
                   maximized_vertical = true }
  },
  -- Password prompt
  {
    rule_any = { class = { "gcr-prompter", "Gcr-prompter" } },
    callback = awful_placement.centered
  },
  -- GtkFileChooserDialog
  {
    rule = { role = "GtkFileChooserDialog" },
    callback = awful_placement.centered
  },
  -- Goldendict
  {
    rule = { instance = "goldendict" },
    properties = {
      honor_padding = 10,
      floating = true
    },
    callback = function (c)
      local lscreen = mouse.screen
      c.width = lscreen.geometry.width / 2
      c.height = lscreen.geometry.height / 2
      awful_placement.centered(c)
      c.ontop = true

    end
  },
  -- Nautilus: desktop_window
  {
    rule = { class = "Nautilus", instance = "desktop_window" },
    properties = {
      maximized_vertical = true,
      maximized_horizontal = true,
      focus = nil,
    },
    callback = function (c)
      c.border_width = 0
      -- c.focusable = false
    end
  }
}
