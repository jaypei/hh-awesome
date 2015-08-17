
local screen = screen
local mouse = mouse
local config = require("config")
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
  awful.client.movetotag(
    hh_tag.tags[mouse.screen][tagidx], c)
end

function make_move_client_tag(tagidx)
  local tagidx = tagidx
  function fn(c)
    move_client_tag(c, tagidx)
  end
  return fn
end

-- Use xprop to view class and instance

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
      size_hints_honor = false
    }
  },
  {
    rule = { class = "URxvt" },
    properties = { opacity = 0.95 }
  },
  -- floating
  {
    rule_any = { class = {
                   "desktop_window", "MPlayer", "pinentry", "rdesktop",
               }},
    properties = { floating = true }
  },
  -- emacs
  {
    rule = { class = "Emacs", instance = "_Remember_" },
    properties = { floating = true },
    callback = awful.titlebar.add
  },
  -- qtalk
  {
    rule = { class = "QunarIM" },
    properties = {
      floating = false,
      border_width = 0
    },
    callback = make_move_client_tag(5)
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
  -- aliwangwang
  {
    rule = { class = "AliWangWang" },
    properties = {
      floating = true,
      border_width = 0
    },
    callback = make_move_client_tag(6)
  },
  -- virtualbox
  {
    rule = { class = "VirtualBox" },
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
    rule_any = { class = { "Firefox", "Chromium-browser", "Google-chrome" } },
    callback = make_move_client_tag(9)
  },
  {
    rule = { class = "Firefox", name = "Youdao translation" },
    properties = { floating = true }
  },
  { rule = { class = "Dwb" },
    callback = make_move_client_tag(9)
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
  }
}
