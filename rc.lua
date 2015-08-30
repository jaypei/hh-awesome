--
-- Author: jaypei <jaypei97159@gmail.com>
-- github.com/jaypei/hh-awesome
--
-- Dependicies
-- Usage:
--  $ pacman -S unclutter rofi
--  
--  $ ln -s /path/to/hh-awesome ~/.config/awesome
--

local config   = require("config")
require("awful.autofocus")
local lain     = require("lain")
lain.helpers   = require("lain.helpers")
first_line     = lain.helpers.first_line
local awful    = require("awful")
local notify   = require("hh.notify")
notify.setup_runtime_errors_handler()
-- Java GUI's fix:
awful.util.spawn_with_shell("wmname LG3D")
require("hh.theme")
require("hh.tag")
require("hh.rule")
require("hh.wibox")
local hh_keys = require("hh.keys")
require("hh.signal")

-- load 
package.path = package.path .. ';' ..
  config.hh_dotfile_dir ..
  '/?.lua;'
if lain.helpers.file_exists(config.hh_dotfile_dir .. "/hhrc.lua") then
  require("hhrc")
end

root.buttons(hh_keys.global_keys.buttons)
root.keys(hh_keys.global_keys.keys)
