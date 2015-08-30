--
-- Author: jaypei <jaypei97159@gmail.com>
-- github.com/jaypei/hh-awesome
--

local G       = _G
local class   = require("middleclass/middleclass")
local awful = require("awful")
awful.util = require("awful.util")
local config = require("config")

module("hh.util")

--------------------------------------------------
-- Execute functions
--------------------------------------------------

local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end

exec  = function (s) oldspawn(s, false) end
sexec = awful.util.spawn_with_shell

function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme ..
                                " > /dev/null || (" .. cmd .. ")")
end

function gexec(cmd)
  local exec_cmd = config.exec_term ..
    " \"[ -x $HOME/.profile ] && source $HOME/.profile; " ..
    cmd .. "\""
  exec(exec_cmd)
end

function clip_translate()
    local clip = nil
    clip = awful.util.pread("xclip -o")
    if clip then
      awful.util.spawn(
        config.dotfile_dir .. "/bin/trans.sh \"" .. clip .. "\"", false)
    end
end

function lock_screen()
  awful.util.spawn(config.dotfile_dir .. "/bin/lock-screen.sh")
end

--------------------------------------------------
-- KeyMap
--------------------------------------------------
KeyMap = class('Key')

function KeyMap:initialize(sweetness)
  self.keys = {}
  self.buttons = {}
end

function KeyMap:def_btn(mod_key, btn, fn)
  self:reg_key_map(self.buttons, awful.button(mod_key, btn, fn))
end

function KeyMap:def_key(mod_key, key, fn)
  self:reg_key_map(self.keys, awful.key(mod_key, key, fn))
end

function KeyMap:reg_key_map(key_map, key_def)
  for k, v in G.pairs(key_def) do
    if G.type(k) == "number" then
      G.table.insert(key_map, v)
    else
      key_map[k] = v
    end
  end
end
