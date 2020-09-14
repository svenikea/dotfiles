--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ
      * (c) 2010, Adrian C. <anrxc@sysphere.org>

--]]

local helpers = require("lain.helpers")
local shell   = require("awful.util").shell
local wibox   = require("wibox")
local string  = string
local lain = require("lain")
local markup = lain.util.markup
-- ALSA volume
-- lain.widget.alsa

local function factory(args)
    local alsa     = { widget = wibox.widget.textbox() }
    local args     = args or {}
    local timeout  = args.timeout or 1 
    local settings = args.settings or function() end
    local icon_dir = os.getenv("HOME") .. "/.config/awesome/themes/zenburn/icons/"
    alsa.icon = wibox.widget.imagebox("/home/john/.config/awesome/themes/zenburn/icons/vol.png")
    alsa.mute 	   = icon_dir .. "vol_mute.png"
    alsa.no 	   = icon_dir .. "vol_no.png"
    alsa.low 	   = icon_dir .. "vol_low.png"
    alsa.cmd           = args.cmd or "amixer"
    alsa.channel       = args.channel or "Master"
    alsa.togglechannel = args.togglechannel

    local format_cmd = string.format("%s get %s", alsa.cmd, alsa.channel)

    if alsa.togglechannel then
        format_cmd = { shell, "-c", string.format("%s get %s; %s get %s",
        alsa.cmd, alsa.channel, alsa.cmd, alsa.togglechannel) }
    end

    alsa.last = {}

    function alsa.update()
        helpers.async(format_cmd, function(mixer)
            local l,s = string.match(mixer, "([%d]+)%%.*%[([%l]*)")
            if alsa.last.level ~= l or alsa.last.status ~= s then
                volume_now = { level = l, status = s }
                widget = alsa.widget
                settings()        
		if volume_now.status == "off" then
            alsa.icon:set_image(alsa.mute)
        elseif tonumber(volume_now.level) == 0 then
            alsa.icon:set_image(alsa.no)
        elseif tonumber(volume_now.level) <= 50 then
          alsa.icon:set_image(alsa.low)
       else
           alsa.icon:set_image(alsa.icon)
       end
       widget:set_markup(markup.font("sans 8", " " .. volume_now.level .. "% "))
                alsa.last = volume_now
            end
        end)
    end

    helpers.newtimer(string.format("alsa-%s-%s", alsa.cmd, alsa.channel), timeout, alsa.update)

    return alsa
end

return factory
