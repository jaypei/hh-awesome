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

require("awful.autofocus")
first_line     = require("lain.helpers").first_line
local awful    = require("awful")
local notify   = require("hh.notify")
notify.setup_runtime_errors_handler()
-- Java GUI's fix:
awful.util.spawn_with_shell("wmname LG3D")
require("hh.theme")
require("hh.tag")
require("hh.rule")
require("hh.wibox")
require("hh.keys")
require("hh.signal")
