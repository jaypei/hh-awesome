local lain = require("lain")
local beautiful = require("beautiful")
local util = require("hh.util")

local _M = util.make_module()

_M.markup = lain.util.markup
_M.space3 = _M.markup.font("Terminus 3", " ")
_M.space2 = _M.markup.font("Terminus 2", " ")
_M.vspace1 = '<span font="Terminus 3"> </span>'
_M.vspace2 = '<span font="Terminus 3">  </span>'

return _M