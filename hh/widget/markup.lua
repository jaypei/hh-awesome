local lain = require("lain")
local beautiful = require("beautiful")

--module("hh.widget.markup")

markup = lain.util.markup
space3 = markup.font("Terminus 3", " ")
space2 = markup.font("Terminus 2", " ")
vspace1 = '<span font="Terminus 3"> </span>'
vspace2 = '<span font="Terminus 3">  </span>'

return {
    markup = markup,
    space3 = space3,
    space2 = space2,
    vspace1 = vspace1,
    vspace2 = vspace2
}
