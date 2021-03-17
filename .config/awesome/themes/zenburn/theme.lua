-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------


local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"
local system_path = "/usr/share/icons/Papirus/22x22/apps/"
-- }}}

-- {{{ Styles
theme.font      = "sans 10"
theme.icon_theme = "Adwaita"
theme.notification_font = "sans 10"
-- {{{ Colors
theme.fg_normal                                 = "#FEFEFE"
theme.fg_focus                                  = "#32D6FF"
theme.fg_urgent                                 = "#C83F11"
theme.bg_normal                                 = "#222222"
theme.bg_focus                                  = "#1E2320"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#00CCFF"
theme.tasklist_bg_focus                         = "#222222"
theme.tasklist_fg_focus                         = "#00CCFF"

theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = 5
theme.border_width  = dpi(7)
theme.border_color_normal = "#3F3F3F"
theme.border_color_active = "#6F6F6F"
theme.border_color_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
theme.tasklist_disable_task_name = true
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(25)
theme.menu_width  = dpi(200)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "zenburn/taglist/squarez.png"
-- thermo
theme.thermometer               = themes_path .. "zenburn/icons/thermo.jpg"


-- Battery info
theme.low_bat                   = themes_path .. "zenburn/icons/spaceman.jpg"
theme.bat_icon_20               = themes_path .. "zenburn/icons/bat-020.png"
theme.bat_icon_40               = themes_path .. "zenburn/icons/bat-040.png"
theme.bat_icon_60               = themes_path .. "zenburn/icons/bat-060.png"
theme.bat_icon_80               = themes_path .. "zenburn/icons/bat-080.png"
theme.bat_icon_100              = themes_path .. "zenburn/icons/bat-100.png"
theme.bat_icon_20_charging      = themes_path .. "zenburn/icons/bat-020-charging.png"
theme.bat_icon_40_charging      = themes_path .. "zenburn/icons/bat-040-charging.png"
theme.bat_icon_60_charging      = themes_path .. "zenburn/icons/bat-060-charging.png"
theme.bat_icon_80_charging      = themes_path .. "zenburn/icons/bat-080-charging.png"
theme.bat_icon_100_charging     = themes_path .. "zenburn/icons/bat-100-charging.png"
theme.bat_icon_charged          = themes_path .. "zenburn/icons/bat-charged.png"
theme.bat                       = themes_path .. "zenburn/icons/battery.png"
theme.ac                        = themes_path .. "zenburn/icons/ac.png"
--theme.taglist_squares_resize = "false"
-- }}}
-- Office icon
theme.office                    = themes_path .. "zenburn/icons/office.png"
theme.word                      = themes_path .. "zenburn/icons/Word.png"
theme.excel                     = themes_path .. "zenburn/icons/Excel.png"
theme.access                    = themes_path .. "zenburn/icons/Access.png"
theme.outlook                   = themes_path .. "zenburn/icons/Outlook.png"
theme.publish                  = themes_path .. "zenburn/icons/mspub.ico"
theme.powerpoint                    = themes_path .. "zenburn/icons/PowerPoint.png"
-- {{{ Misc
theme.edit           = system_path .. "xfce-edit.svg"
theme.hibernate           = system_path .."xfsm-hibernate.svg"
theme.logout           = system_path .. "xfsm-logout.svg"
theme.poweroff      = system_path .. "cs-power.svg"
theme.reboot           = system_path .. "xfsm-reboot.svg"
theme.restart        = system_path .. "system-restart.svg"
theme.sleep           = system_path .. "sleep.svg"
theme.awesome_icon           = themes_path .. "zenburn/icons/awesome-icon.png"
theme.hotkeys           = system_path .. "khotkeys.svg"
theme.manual            = system_path .. "deepin-manual.svg"
theme.menu_submenu_icon      = themes_path .. "zenburn/icons/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "zenburn/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "zenburn/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "zenburn/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "zenburn/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "zenburn/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "zenburn/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "zenburn/layouts/dwindle.png"
theme.layout_max        = themes_path .. "zenburn/layouts/max.png"
theme.layout_fullscreen = themes_path .. "zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "zenburn/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "zenburn/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "zenburn/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "zenburn/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "zenburn/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "zenburn/layouts/cornerse.png"
-- }}}
-- System icon
theme.firefox_icon = "/usr/lib/firefox/browser/chrome/icons/default/default16.png"
theme.terminal_icon = system_path .. "lxterminal.svg"
theme.thunar_icon = system_path .. "thunar.svg"
theme.evince_icon = system_path .. "evince.svg"
theme.neovim_icon = system_path .. "nvim-gtk.svg"
theme.firefox_icon = system_path .. "mozilla-firefox.svg"
theme.chrome_icon = system_path .. "google-chrome.svg"
theme.wpa_icon =  system_path .. "mate-network-properties.svg"
theme.pamac_icon = system_path .. "mx-packageinstaller.svg"
theme.internet = system_path .. "web-browser.svg"
theme.settings = system_path .. "applications-accessories.svg"
theme.accessories = themes_path .. "zenburn/icons/accessories.png"
theme.exit = themes_path .. "zenburn/icons/exit.png"
theme.system_tools = system_path .. "utools.svg"
theme.stacer_icon = system_path .. "stacer.svg"
theme.update_icon = system_path .. "pamac-updater.svg"
theme.xfce4_icon = system_path .. "org.xfce.about.svg"
theme.virt_manager_icon = system_path .. "virt-manager.svg"
-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "zenburn/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
