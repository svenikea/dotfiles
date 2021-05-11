-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- Initial launcher
--local freedesktop = require("freedesktop")
local lain = require("lain")
local markup = lain.util.markup

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
-- }}}

-- {{{ Variable definitions
-- configuration location
-- Themes define colours, icons, font and wallpapers.
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/zenburn/theme.lua")
-- This is used later as the default terminal and editor to run.

terminal 			= "lxterminal"
word 		 		= "word"
excel 				= "excel"
vlc 				= "vlc"
publish 			= "publish"
powerpoint 			= "powerpoint"
editor 				= os.getenv("EDITOR") or "nvim"
editor_cmd 			= terminal .. " -e " .. editor 
firefox 			= "firefox"
word 				= "word"
file_explorer_gui 		= "thunar"
file_explorer_setting 		= "thunar-settings"
excel 				= "excel"
stacer 				= "stacer"
publish 			= "publish"
powerpoint 			= "powerpoint"
file_explorer 			= "ranger"
Neovim				= "nvim"
software_update 		= "pamac-manager --updates"
software_center 		= "pamac-manager"
rename 				= "thunar --bulk-rename"
Screenshot 			= "maim ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d).png"
snapshot 			= "import ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d).png"
wallpaper 			= "feh --recursive --bg-fill --randomize ~/Pictures/wallpapers/"
run_box 			= "rofi -modi drun,run -show drun -show-icons"
chrome 				= "google-chrome-stable"
compton 			= "compton --config ~/.config/compton/compton.conf"
wpa_gui 			= "wpa_gui"
pdfReader 			= "evince"
xfce_about 			= "xfce4-about"
virt_manager 			= "virt-manager"
-- Utility 
volume_up 			= "amixer -D pulse set Master 2%+"
volume_down 			= "amixer -D pulse set Master 2%-"
volume_toggle 			= "amixer -D pulse set Master toggle"
brightness_up 			= "xbacklight -inc 1"
brightness_down 		= "xbacklight -dec 1"
logout 				= "dm-tool lock"
lid_operation 			= "light-locker --lock-on-suspend"
-- System operation
sleep 				= "systemctl suspend"
reboot 				= "systemctl reboot"
poweroff 			= "systemctl poweroff"
hibernate 			= "systemctl hibernate"
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
--

-- {{ Effect and theme
--client.connect_signal("manage", function (c)
 --   c.shape = function(cr,w,h)
  --      gears.shape.rounded_rect(cr,w,h,15)
   -- end
--end)

modkey = "Mod4"
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end, beautiful.hotkeys},
   { "manual", terminal .. " -e man awesome", beautiful.manual },
   { "edit config", editor_cmd .. " " .. awesome.conffile, beautiful.edit },
   { "restart", awesome.restart, beautiful.reboot },
   --{ "logout", function() awesome.quit() end },
}
office = {
	{"Word", ord, beautiful.word},
	{"Excel", excel, beautiful.excel},
	{"Powerpoint", powerpoint, beautiful.powerpoint},
	{"Publish", publish, beautiful.publish},
	{"PDF Viewer", pdfReader, beautiful.evince_icon},
}
exit = {
	{ "logout", logout, beautiful.logout },
	{ "sleep", sleep, beautiful.sleep },
	{ "reboot", reboot, beautiful.reboot },
	{ "hibernate", hibernate, beautiful.hibernate },
	{ "poweroff", poweroff, beautiful.poweroff },
}
accessories = {
	{"About XFCE",xfce_about, beautiful.xfce4_icon },
	{"File Manager", file_explorer_gui, beautiful.thunar_icon},
	{"Terminal Emulator", lxterminal, beautiful.terminal_icon},
	{"Neovim", Neovim, beautiful.neovim_icon}, 
}
internet = {
	{"Firefox", firefox, beautiful.firefox_icon},
	{"Google Chrome", chrome, beautiful.chrome_icon},

}

multimedia = {
	{"VLC media player", vlc, beautiful.vlc_icon},
}

settings = {
	{"Network Configuration", wpa_gui, beautiful.wpa_icon},
	{"File Manager Settings", file_explorer_setting, beautiful.thunar_icon},
}
system_tools= {
	{"Add/Remove Software", software_center, beautiful.pamac_icon },
	{"Bulk Rename", rename, beautiful.thunar_icon},
	{"LXTerminal", terminal, beautiful.terminal_icon},
	{"Software Update", software_update, beautiful.update_icon},
	{"Thunar File Manager", thunar, beautiful.thunar_icon},
	{"Stacer", stacer, beautiful.stacer_icon},
	{"Virt-Manager", virt_manager,beautiful.virt_manager_icon},
}
mymainmenu = awful.menu {
	{"Terminal", terminal, beautiful.terminal_icon},
	{"Browser", firefox, beautiful.internet},
	{"Files", file_explorer_gui, beautiful.thunar_icon},
	{"Accessories", accessories, beautiful.accessories},
	{"Multimedia", multimedia, beautiful.multimedia_icon},
	{"Internet", internet, beautiful.internet},
	{"Settings", settings, beautiful.settings},
	{"System Tools", system_tools, beautiful.system_tools},
	{"Awesome", myawesomemenu, beautiful.awesome_icon },
	{"Office", office, beautiful.office},
	{"Exit", exit, beautiful.exit},
}

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Tag
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
    })
end)
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock(" %a %b %d, %I:%M %P")

screen.connect_signal("request::wallpaper", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)
-- Widget bar
local mympd = lain.widget.mpd(
{
	settings = function()
        mpd_notification_preset = {
   title   = "Now playing",
   timeout = 0,
   hover_timeout = 0.5,
   text    = string.format("%s (%s) - %s\n%s", mpd_now.artist,
             mpd_now.album, mpd_now.date, mpd_now.title),

}
	end
})
-- Battery ---------------------------------------------
local baticon = wibox.widget.imagebox(beautiful.bat)



local bat_widget = lain.widget.bat({
	settings = function ()
	if bat_now.status and bat_now.status ~= "N/A" then
		if (bat_now.perc >= 10 and bat_now.perc <=20) then
			widget:set_markup(markup.font(font, " " .. bat_now.perc .. "% "))
			baticon:set_image(beautiful.bat_icon_20)
		end
		if (bat_now.perc >= 21 and bat_now.perc <=40) then
			widget:set_markup(markup.font(font, " " .. bat_now.perc .. "% "))
			baticon:set_image(beautiful.bat_icon_40)
		end
		if (bat_now.perc >= 41 and bat_now.perc <=60) then
			widget:set_markup(markup.font(font, " " .. bat_now.perc .. "% "))
			baticon:set_image(beautiful.bat_icon_60)
		end
		if (bat_now.perc >= 61 and bat_now.perc <=80) then
			widget:set_markup(markup.font(font, " " .. bat_now.perc .. "% "))
			baticon:set_image(beautiful.bat_icon_80)
		end
		if (bat_now.perc >= 81 and bat_now.perc <=100) then
			widget:set_markup(markup.font(font, " " .. bat_now.perc .. "% "))
			baticon:set_image(beautiful.bat_icon_100)
		end
	end
	if bat_now.status == "Charging" then
		widget:set_markup(markup.font(font, " AC " .. bat_now.perc .. " %"))
		baticon:set_image(beautiful.ac)
        end
	if bat_now.status == "Full" then
            widget:set_markup(markup.font(font, " Full charged "))
	    baticon:set_image(beautiful.bat_icon_charged)
    	end
	end,

})
	
local fs_icon = lain.widget.fs().icon
local fs = lain.widget.fs({})
local temp_icon = lain.widget.temp().icon
local temp = lain.widget.temp().widget
local mem = lain.widget.mem()
local mem_icon = lain.widget.mem().icon
local cpu = lain.widget.cpu()
local cpu_icon = lain.widget.cpu().icon
local alsa = lain.widget.alsa()
local alsa_icon = lain.widget.alsa().icon
local net = lain.widget.net().widget
local net_icon = lain.widget.net().icon
screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "A", "W", "E", "S", "O", "M", "E", "W", "M" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc( 1) end),
            awful.button({ }, 5, function () awful.layout.inc(-1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx( 1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx(-1) end),
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox.widget = {
	expand = "yes",
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
	    fs_icon,
	    fs,
	    wibox.widget.textbox(" "), 
	    temp_icon,
	    temp,
	    wibox.widget.textbox(" "), 
	    mem_icon,
	    mem,
	    wibox.widget.textbox(" "),
	    mympd,
	    wibox.widget.textbox(" "),
	    cpu_icon,
	    cpu,
	    wibox.widget.textbox(" "),
	    baticon,
	    bat_widget,
	    wibox.widget.textbox(" "),
	    alsa_icon,
	    alsa,
	    wibox.widget.textbox(" "),
	    net_icon,
	    net,
	    wibox.widget.textbox(" "),
            mytextclock,	   
	    wibox.widget.textbox(" "),
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
	
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev),
})
-- }}}

-- {{{ Key bindings

-- General Awesome keys
awful.keyboard.append_global_keybindings({
-- Utility keybindings
   awful.key({}, "XF86AudioLowerVolume", function() os.execute(volume_down) end, {description = "volume down", group = "hotkeys"}),
   awful.key({}, "XF86AudioRaiseVolume", function() os.execute(volume_up) end, {description = "volume up", group = "hotkeys"}),
   awful.key({}, "XF86AudioMute", function() os.execute(volume_toggle) end, {description = "volume mute", group = "hotkeys"}),
   awful.key({}, "XF86MonBrightnessUp", function() os.execute(brightness_up) end, {description = "brightness up", group = "screen"}),
   awful.key({}, "XF86MonBrightnessDown", function() os.execute(brightness_down) end, {description = "brightness down", group = "screen"}),
   awful.key({"Mod1"}, "F6", function() os.execute(brightness_up) end, {description = "brightness up", group = "screen"}),
   awful.key({"Mod1"}, "F5", function() os.execute(brightness_down) end, {description = "brightness down", group = "screen"}),
   awful.key({}, "Print", function() awful.spawn.with_shell(Screenshot) end, {description = "screenshot", group = "screen"}),
   awful.key({"Mod1"}, "F1", function() awful.spawn.with_shell(snapshot) end, {description = "snapshot", group = "screen"}),

--- {{ Application launcher
    awful.key({modkey, },"c", function () awful.spawn(chrome)end ,
    {description = "open chrome", group = "launcher"}),
    awful.key({modkey, },"f", function () awful.spawn(file_explorer_gui)end ,
    {description = "open spacefm", group = "launcher"}),
    awful.key({modkey, },"d", function () awful.spawn(pdfReader)end ,
    {description = "open PDF reader", group = "launcher"}),
    awful.key({modkey, }, "b", function () awful.spawn(firefox)end ,
    {description = "open firefox", group = "launcher"}),
    awful.key({modkey, }, "q", function () awful.spawn(Neovim_QT)end ,
    {description = "open neovim qt mode", group = "launcher"}),

    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey },            "r",     function () awful.util.spawn_with_shell(run_box) end,
              {description = "run dmenu", group = "launcher"}),
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
})


-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
})


awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
        awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        awful.key({ modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)

-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false      }
    }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
end)

-- }}}

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button({ }, 1, function()
            c:activate { context = "titlebar", action = "mouse_move"  }
        end),
        awful.button({ }, 3, function()
            c:activate { context = "titlebar", action = "mouse_resize"}
        end),
    }

    awful.titlebar(c).widget = {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-------
-------
-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

--naughty.connect_signal("request::display", function(n)
--    naughty.layout.box { notification = n }
--end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

-- }}}

awful.spawn.with_shell(wallpaper)
awful.util.spawn_with_shell(lid_operation)		
--awful.util.spawn_with_shell("dunst -conf /home/john/.config/dunst/dunstrc")
