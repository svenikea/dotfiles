--[[

     Licensed under GNU General Public License v2
      * (c) 2013,      Luca CPZ
      * (c) 2010-2012, Peter Hofmann

--]]
local gears 		   = require ("gears")
local beautiful 	   = require("beautiful")
local helpers              = require("lain.helpers")
local wibox                = require("wibox")
local gmatch, lines, floor = string.gmatch, io.lines, math.floor
local lain = require("lain")
local markup = lain.util.markup
-- Memory usage (ignoring caches)
-- lain.widget.mem
local function factory(args)
    local mem      = { widget = wibox.widget.textbox() }
    local args     = args or {}
    local icon_dir = os.getenv("HOME") .. "/.config/awesome/themes/zenburn/icons/"
    local timeout  = args.timeout or 1
    local settings = args.settings or function() end 
    mem.icon_path = icon_dir .. "mem.png"
    mem.icon = wibox.widget.imagebox(mem.icon_path)
    function mem.update()
        mem_now = {}
        for line in lines("/proc/meminfo") do
            for k, v in gmatch(line, "([%a]+):[%s]+([%d]+).+") do
                if     k == "MemTotal"     then mem_now.total = floor(v / 1024 + 0.5)
                elseif k == "MemFree"      then mem_now.free  = floor(v / 1024 + 0.5)
                elseif k == "Buffers"      then mem_now.buf   = floor(v / 1024 + 0.5)
                elseif k == "Cached"       then mem_now.cache = floor(v / 1024 + 0.5)
                elseif k == "SwapTotal"    then mem_now.swap  = floor(v / 1024 + 0.5)
                elseif k == "SwapFree"     then mem_now.swapf = floor(v / 1024 + 0.5)
                elseif k == "SReclaimable" then mem_now.srec  = floor(v / 1024 + 0.5)
                end
            end
        end

        mem_now.used = mem_now.total - mem_now.free - mem_now.buf - mem_now.cache - mem_now.srec
        mem_now.swapused = mem_now.swap - mem_now.swapf
        mem_now.perc = math.floor(mem_now.used / mem_now.total * 100)
	if (mem_now.perc < 29 ) then mem_now.color = "#00ff00"
	elseif (mem_now.perc > 30 and mem_now.perc < 69) then mem_now.color = "#ffff00"
	elseif (mem_now.perc > 70) then mem_now.color = "#ff0000" 
	end
        widget = mem.widget
        settings()
	widget:set_markup(markup(mem_now.color, mem_now.used) .. markup("#ffff00" ,"M"))
    end
    helpers.newtimer("mem", timeout, mem.update)
    return mem
end
return factory
