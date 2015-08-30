
local util    = require("hh.util")
local config  = require("etc/config")
module("hh.startups")

-- Java GUI's fix
util.sexec("wmname LG3D")
-- Set keyboard interval
util.sexec("xset r rate 300")
util.run_once("compton --config "
                .. config.dotfile_dir
                .. "/etc/compton.conf")
