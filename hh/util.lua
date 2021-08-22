--
-- Author: jaypei <jaypei97159@gmail.com>
-- github.com/jaypei/hh-awesome
--

local string  = string
local G       = _G
local class   = require("middleclass/middleclass")
local awful   = require("awful")
awful.util    = require("awful.util")
local config  = require("etc/config")
local lain    = require("lain")
lain.helpers  = require("lain.helpers")

function make_module()
  local _Mod = {}
  _Mod._Mod = _Mod
  return _Mod
end

local _M = make_module()
_M.make_module = make_module

--------------------------------------------------
-- String System
--------------------------------------------------
function string_trim(s)
  return string.match(s,'^()%s*$') and '' or string.match(s,'^%s*(.*%S)')
end
_M.string_trim = string_trim

--------------------------------------------------
-- File System
--------------------------------------------------
function file_exists(path)
  local f = io.open(path)
  if f then
      local s = f:read()
      f:close()
      f = s
  end
  return f ~= nil
end
_M.file_exists = file_exists

function dir_exists(path)
    local f = G.io.open(path, "r")
    if f == nil then
      return false
    end
    local ok, err, code = f:read(1)
    f:close()
    return code == 21
end
_M.dir_exists = dir_exists

--------------------------------------------------
-- Execute functions
--------------------------------------------------

local oldspawn = awful.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end

_M.exec  = function (s) oldspawn(s, false) end
_M.sexec = awful.spawn.with_shell

function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.spawn.with_shell(
    "pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end
_M.run_once = run_once

function gexec(cmd)
  local exec_cmd = config.exec_term ..
    " \"[ -x $HOME/.profile ] && source $HOME/.profile; " ..
    cmd .. "\""
  _M.exec(exec_cmd)
end
_M.gexec = gexec

function _M.clip_translate()
    -- kill dicts
    local find_golden_dict = function (c)
      return awful.rules.match_any(
        c, {
          instance = "goldendict",
          class = { "GoldenDict", "Goldendict" }
      })
    end
    for c in awful.client.iterate(find_golden_dict) do
      c:kill()
      return
    end
    -- open dict
    awful.spawn.easy_async("xsel -o", function(stdout, stderr, reason, exit_code)
        local escaped_out, _ = string.gsub(string.gsub(stdout, "'", ""), '"', '\\\"')
	escaped_out = string_trim(escaped_out)
        gexec("goldendict '" .. escaped_out .. "'")
    end)
end

function _M.lock_screen()
  awful.util.spawn(config.dotfile_dir .. "/bin/lock-screen.sh")
end

function _M.show_rofi(from_binutils)
  local binutils_dir = config.hh_dotfile_dir .. "/binutils"
  if from_binutils and _M.dir_exists(binutils_dir) then
    gexec(config.dotfile_dir .. "/bin/show-rofi.sh '" .. binutils_dir .. "'")
  else
    gexec(config.dotfile_dir .. "/bin/show-rofi.sh")
  end
end

--------------------------------------------------
-- KeyMap
--------------------------------------------------
_M.KeyMap = class('Key')

function _M.KeyMap:initialize(sweetness)
  self.keys = {}
  self.buttons = {}
end

function _M.KeyMap:def_btn(mod_key, btn, fn)
  self:reg_key_map(self.buttons, awful.button(mod_key, btn, fn))
end

function _M.KeyMap:def_key(mod_key, key, fn)
  self:reg_key_map(self.keys, awful.key(mod_key, key, fn))
end

function _M.KeyMap:reg_key_map(key_map, key_def)
  for k, v in G.pairs(key_def) do
    if G.type(k) == "number" then
      G.table.insert(key_map, v)
    else
      key_map[k] = v
    end
  end
end

return _M