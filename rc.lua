--
-- Author: jaypei <jaypei97159@gmail.com>
-- github.com/jaypei/hh-awesome
--

require("awful.autofocus")
local config   = require("etc/config")
local lain     = require("lain")
lain.helpers   = require("lain.helpers")
first_line     = lain.helpers.first_line
local notify   = require("hh.notify")
notify.setup_runtime_errors_handler()

require("hh.startups")
require("hh.theme")
require("hh.tag")
require("hh.rule")
require("hh.wibox")
local hh_keys  = require("hh.keys")
require("hh.signal")

-- Load hhrc
package.path =
  config.hh_dotfile_dir ..
  '/awesome/?.lua;' .. ';' ..
  package.path
if lain.helpers.file_exists(config.hh_dotfile_dir .. "/awesome/hhrc.lua") then
  require("hhrc")
end

-- monky patches
require("eminent")

root.buttons(hh_keys.global_keys.buttons)
root.keys(hh_keys.global_keys.keys)
