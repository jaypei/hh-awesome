theme                               = {}
border_normal_color                 = "#696969"

themes_dir                          = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
theme.wallpaper                     = themes_dir .. "/wall.png"

theme.useless_gap_width             = 25

theme.font                          = "Source Code Pro 10.5"
theme.fg_normal                     = "#cdcdcd"
theme.fg_focus                      = "#0099cc"
theme.fg_urgent                     = "#00ff00"
theme.bg_normal                     = "#000000"
theme.bg_focus                      = "#000000"
theme.bg_urgent                     = "#2a1f1e"
theme.taglist_bg_focus              = "png:" .. themes_dir .. "/icons/taglist_bg_focus.png"
theme.border_width                  = 2
theme.border_normal                 = border_normal_color
theme.border_focus                  = "#4682b4"
theme.border_marked                 = "#50ff00"
theme.menu_height                   = 16
theme.menu_width                    = 140

-- titlebar_[bg|fg]_[normal|focus]
theme.titlebar_fg_normal = "#000000"
theme.titlebar_bg_normal = "#696969"
theme.titlebar_fg_focus  = "#ffffff"
theme.titlebar_bg_focus  = "#4682b4"
-- titlebar_[name]_button_[normal/focus]_[state]"
-- name: floating, maximized, minimize, close, ontop, sticky
theme.titlebar_close_button_focus  = themes_dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_dir .. "/icons/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = themes_dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_dir .. "/icons/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_dir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_dir .. "/icons/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.wibox_border_width            = 2
theme.wibox_border                  = "#000000"

theme.submenu_icon                  = themes_dir .. "/icons/submenu.png"
-- theme.taglist_squares_sel           = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/icons/square_sel.png"

theme.tasklist_disable_icon         = false
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

theme.submenu_icon                  = themes_dir .. "/icons/submenu.png"
theme.widget_temp                   = themes_dir .. "/icons/temp.png"
theme.widget_uptime                 = themes_dir .. "/icons/ac.png"
theme.widget_cpu                    = themes_dir .. "/icons/cpu.png"
theme.widget_weather                = themes_dir .. "/icons/dish.png"
theme.widget_fs                     = themes_dir .. "/icons/fs.png"
theme.widget_mem                    = themes_dir .. "/icons/mem.png"
theme.widget_fs                     = themes_dir .. "/icons/fs.png"
theme.widget_note                   = themes_dir .. "/icons/note.png"
theme.widget_note_on                = themes_dir .. "/icons/note_on.png"
theme.widget_netdown                = themes_dir .. "/icons/net_down.png"
theme.widget_netup                  = themes_dir .. "/icons/net_up.png"
theme.widget_mail                   = themes_dir .. "/icons/mail.png"
theme.widget_batt                   = themes_dir .. "/icons/bat.png"
theme.widget_clock                  = themes_dir .. "/icons/clock.png"
theme.widget_vol                    = themes_dir .. "/icons/spkr.png"

theme.layout_tile                   = themes_dir .. "/icons/tile.png"
theme.layout_tilegaps               = themes_dir .. "/icons/tilegaps.png"
theme.layout_tileleft               = themes_dir .. "/icons/tileleft.png"
theme.layout_tilebottom             = themes_dir .. "/icons/tilebottom.png"
theme.layout_tiletop                = themes_dir .. "/icons/tiletop.png"
theme.layout_fairv                  = themes_dir .. "/icons/fairv.png"
theme.layout_fairh                  = themes_dir .. "/icons/fairh.png"
theme.layout_spiral                 = themes_dir .. "/icons/spiral.png"
theme.layout_dwindle                = themes_dir .. "/icons/dwindle.png"
theme.layout_max                    = themes_dir .. "/icons/max.png"
theme.layout_fullscreen             = themes_dir .. "/icons/fullscreen.png"
theme.layout_magnifier              = themes_dir .. "/icons/magnifier.png"
theme.layout_floating               = themes_dir .. "/icons/floating.png"
theme.layout_termfair               = themes_dir .. "/icons/fairv.png"
theme.layout_uselessfair            = themes_dir .. "/icons/fairv.png"
theme.layout_uselessfairh           = themes_dir .. "/icons/fairh.png"
theme.layout_uselessdwindle         = themes_dir .. "/icons/dwindle.png"
theme.layout_uselesstile            = themes_dir .. "/icons/tile.png"

theme.vol                           = themes_dir .. "/icons/vol.png"
theme.vol_low                       = themes_dir .. "/icons/vol_low.png"
theme.vol_no                        = themes_dir .. "/icons/vol_no.png"
theme.vol_mute                      = themes_dir .. "/icons/vol_mute.png"
theme.widget_bg                     = themes_dir .. "/icons/widget_bg.png"
theme.ac                            = themes_dir .. "/icons/ac.png"
theme.bat                           = themes_dir .. "/icons/bat.png"
theme.bat_low                       = themes_dir .. "/icons/bat_low.png"
theme.bat_no                        = themes_dir .. "/icons/bat_no.png"

-- naughty
theme.naughty_font                  = "Ubuntu Mono 20px"
theme.naughty_defaults_fg           = "#ffffff"
theme.naughty_defaults_bg           = "#006400"
theme.naughty_defaults_border_color = border_normal_color
theme.naughty_border_width          = theme.border_width

theme.naughty_critical_fg           = "#cfffff"
theme.naughty_critical_bg           = "#cacaca"
theme.naughty_critical_border_color = border_normal_color

return theme
