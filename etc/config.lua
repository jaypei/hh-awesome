local home_dir       = os.getenv("HOME")
local dotfile_dir    = home_dir .. "/.config/awesome"
local hh_dotfile_dir = home_dir .. "/.hh/awesome"

return {
  hh_dotfile_dir  = hh_dotfile_dir,
  dotfile_dir     = dotfile_dir,
  exec_term       = "/usr/bin/zsh -c",
  modkey          = "Mod4",
  altkey          = "Mod1",
  terminal        = "urxvt",
  file_explorer   = "nemo",
  editor          = os.getenv("EDITOR") or "emacs -nw",
  gui_editor      = "emacs",
  browser         = "dwb",
  browser2        = "firefox",
  graphics        = "gimp",
  sync_select_ws  = false,
  screen_padding  = { top=5, right=5, bottom=5, left=5 }
}
