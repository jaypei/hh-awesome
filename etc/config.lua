local home_dir       = os.getenv("HOME")
local dotfile_dir    = home_dir .. "/.config/awesome"
local hh_dotfile_dir = home_dir .. "/.hh"

return {
  hh_dotfile_dir  = hh_dotfile_dir,
  dotfile_dir     = dotfile_dir,
  exec_term       = "/usr/bin/zsh -c",
  modkey          = "Mod4",
  altkey          = "Mod1",
  terminal        = "urxvt",
  file_explorer   = "nemo --no-desktop",
  editor          = os.getenv("EDITOR") or "emacs -nw",
  gui_editor      = "emacs",
  browser         = "dwb",
  browser1        = "firefox",
  graphics        = "gimp",
  sync_select_ws  = false,
  enable_titlebar = true,
  screen_padding  = { top=0, right=0, bottom=0, left=0 }
}
