--
-- Author: jaypei <jaypei97159@gmail.com>
-- github.com/jaypei/hh-awesome
--

local awful = require("awful")
awful.util = require("awful.util")
local config = require("config")

local print = print

module("hh.util")

-- Disable cursor animation:

local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end

exec   = function (s) oldspawn(s, false) end
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
        config.dotfile_dir .. "bin/trans.sh \"" .. clip .. "\"", false)
    end
end
