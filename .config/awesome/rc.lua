-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- Vicious
local vicious = require("vicious")

-- custom libs
require("helpers")

local treesome = require("treesome")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
beautiful.init(awful.util.getdir("config") .. "/themes/catio/theme.lua")

-- This is used later as the default terminal and editor to run.
rxvt = "urxvtc"
terminal = "urxvtc"
browser = "firefox"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"


-- {{ Default variables

cpugraph_enable = true -- Show CPU graph
cputext_format = " $1%" -- %1 average cpu, %[2..] every other thread individually

membar_enable = true -- Show memory bar
memtext_format = " $1%" -- %1 percentage, %2 used %3 total %4 free

date_format = "%d/%m %T" -- refer to http://en.wikipedia.org/wiki/Date_(Unix) specifiers
-- }} Default variables

local networks
if hostname == 'io' then
  networks = {'eth0', 'wlan0'}
else
  networks = { 'eth0' }
end



--
local hostname = awful.util.pread('hostname -s'):gsub('\n', '')
local host_config_file = awful.util.getdir('config') .. '/rc.' .. hostname .. '.lua'
local host_config_file = awful.util.getdir('config') .. '/rc.' .. hostname .. '.lua'
if awful.util.file_readable(host_config_file) then
  local host_config_function, host_config_load_error
  host_config_function, host_config_load_error = loadfile(host_config_file)
  if not host_config_load_error then
    host_config_function()
  else
    print(string.format('[awesome] Failed to load %s: %s', host_config_file, host_config_load_error))
  end
end

--require( hostname )



-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    --tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
    tags[s] = awful.tag({"一", "二", "三", "四", "五", "六", "七", "八", "九", "十"}, s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual"      ,  terminal .. " -e man awesome" },
   { "edit config" ,  editor_cmd .. " " .. awesome.conffile },
   { "restart"     ,  awesome.restart },
   { "quit"        ,  awesome.quit }
}

mysystemmenu = {
  { "reboot" ,  'sudo shutdown -r now' },
  { "halt"   ,  'sudo halt -p' }
}
mymainmenu = awful.menu({ items = {
  { "awesome"       ,  myawesomemenu  ,  beautiful.awesome_icon },
  { "firefox"       ,  browser },
  { "system"        ,  mysystemmenu },
  { "open terminal" ,  terminal }
  }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
-- }}}







-- {{{ Wibox

-- {{ Icons

mycpuicon = wibox.widget.imagebox()
mycpuicon:set_image(beautiful.widget_cpu)

myneticon = wibox.widget.imagebox()
myneticonup = wibox.widget.imagebox()

myneticonup:set_image(beautiful.widget_netup)
myneticon:set_image(beautiful.widget_net)

myvolicon = wibox.widget.imagebox()
myvolicon:set_image(beautiful.widget_vol)

mymusicicon = wibox.widget.imagebox()
mymusicicon:set_image(beautiful.widget_music)

myspacer = wibox.widget.textbox()
myspacer:set_text(" ")

myseparator = wibox.widget.textbox()
myseparator.text = "|"

middlespacer = wibox.widget.textbox()
middlespacer.text = "]["

leftspacer = wibox.widget.textbox()
leftspacer.text = "["

rightspacer = wibox.widget.textbox()
rightspacer.text = "]"



mydiskicon = wibox.widget.imagebox()
mydiskicon:set_image(beautiful.widget_fs)

mytimeicon = wibox.widget.imagebox()
mytimeicon:set_image(beautiful.widget_time)

mymemicon = wibox.widget.imagebox()
mymemicon:set_image(beautiful.widget_mem)
-- }} Icons

-- {{{ Battery state

-- Initialize widget
--batwidget = widget({ type = "textbox" })
--baticon = widget({ type = "imagebox" })
--
---- Register widget
--vicious.register(batwidget, vicious.widgets.bat,
--  function (widget, args)
--    if args[2] == 100 then return ""
--    else
--      baticon.image = image(beautiful.widget_bat)
--      return "<span color='white'>".. args[2] .. "%</span><span color='red'>" .. args[3] .. " more</span>"
--    end
--  end, 61, "BAT0"
--  )
-- }}} Battery state

--{{{  Network usage widget
function print_net(name, down, up)
  return '<span color="'
  .. "#CC9393" ..'">' .. down .. '</span> <span color="'
  .. "#7F9F7F" ..'">' .. up .. '</span>'
end

dnicon = wibox.widget.imagebox()
upicon = wibox.widget.imagebox()

-- Initialize widget
netwidget = wibox.widget.textbox()
-- Register widget
-- vicious.register(netwidget, vicious.widgets.net,
-- function (widget, args)
--   local networks = {'eth0', 'wlan0'}
--   for _,device in pairs(networks) do
--     if tonumber(args["{".. device .." carrier}"]) > 0 then
--       netwidget.found = true
--       dnicon.image = image(beautiful.widget_down)
--       upicon.image = image(beautiful.widget_up)
--       return print_net(device, args["{"..device .." down_kb}"], args["{"..device.." up_kb}"])
--     end
--   end
-- end, 3)
-- }}} Network usage widget

-- {{{ Temperature
--tzswidget = widget({ type = "textbox" })
--vicious.register(tzswidget, vicious.widgets.thermal,
--  function (widget, args)
--    if args[1] > 0 then
--      tzfound = true
--      return " " .. args[1] .. "C°"
--    else return ""
--    end
--  end
--  , 19, "thermal_zone0")
-- }}} Temperature

---- {{{ Volume level
--volicon = widget({ type = "imagebox" })
--volicon.image = image(beautiful.widget_vol)
---- Initialize widgets
--volbar    = awful.widget.progressbar()
--volwidget = widget({ type = "textbox" })
---- Progressbar properties
--volbar:set_vertical(true):set_ticks(true)
--volbar:set_height(16):set_width(8):set_ticks_size(2)
--volbar:set_background_color(beautiful.fg_off_widget)
--volbar:set_gradient_colors({ beautiful.fg_widget,
--   beautiful.fg_center_widget, beautiful.fg_end_widget
--}) -- Enable caching
--vicious.cache(vicious.widgets.volume)
---- Register widgets
--vicious.register(volbar,    vicious.widgets.volume,  "$1",  2, "PCM")
--vicious.register(volwidget, vicious.widgets.volume, " $1%", 2, "PCM")
---- Register buttons
--volbar.widget:buttons(awful.util.table.join(
--  awful.button({ }, 1, function () exec("kmix") end),
--  awful.button({ }, 4, function () exec("amixer -q set PCM 2dB+", false) vicious.force({volbar, volwidget}) end),
--  awful.button({ }, 5, function () exec("amixer -q set PCM 2dB-", false) vicious.force({volbar, volwidget}) end)
--)) -- Register assigned buttons
--volwidget:buttons(volbar.widget:buttons())
---- }}}

-- {{{ Memory usage

-- icon
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)

if membar_enable then
-- Initialize widget
  membar = awful.widget.progressbar( { align = "right"} )
  -- Pogressbar properties
  membar:set_vertical(true):set_ticks(true)
  membar:set_height(16):set_width(8):set_ticks_size(2)
  membar:set_background_color(beautiful.fg_off_widget)
  --membar:set_gradient_colors({ beautiful.fg_widget, beautiful.fg_center_widget, beautiful.fg_end_widget })
  -- Register widget
  vicious.register(membar, vicious.widgets.mem, "$1", 13)
end
-- mem text output
memtext = wibox.widget.textbox()
vicious.register(memtext, vicious.widgets.mem, "$1% ($2/$3MB)", 13)
-- }}} Memory usage

-- Memory  widget
memwidget = awful.widget.graph({ align = "right" })
--memwidget = awful.widget.progressbar()
-- Progressbar properties
memwidget:set_width(24)
--memwidget:set_height(10)
--memwidget:set_vertical(true)
memwidget:set_background_color("#494B4F")
--memwidget:set_border_color(nil)
memwidget:set_color("#AECF96")
-- memwidget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })
-- Register widget
vicious.register(memwidget, vicious.widgets.mem, "$1", 13)

---- Initialize widget
--cpuwidget = awful.widget.graph()
---- Graph properties
--cpuwidget:set_width(50)
--cpuwidget:set_background_color("#494B4F")
--cpuwidget:set_color("#FF5656")
--cpuwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
---- Register widget
--vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

function gradient(min, max, val)
  if (val > max) then val = max end
  if (val < min) then val = min end

  local v = val - min
  local d = (max - min) * 0.5
  local red, green

  if (v <= d) then
    red = (255 * v) / d
    green = 255
  else
    red = 255
    green = 255 - (255 * (v-d)) / (max - min - d)
  end

  return string.format("#%02x%02x00", red, green)
end

-- {{ CPU widget
local cpuwidget = wibox.widget.textbox()

vicious.register(cpuwidget, vicious.widgets.cpu,
function (widget, args)
  local text
  -- list only real cpu cores
  for i=1,#args do
    -- alerts, if system is stressed
    if args[i] > 50 then
      -- from light green to light red
      local color = gradient(50,100,args[i])
      args[i] = string.format("<span color='%s'>%2d</span>", color, args[i])
    end

    -- append to list
    if i > 2 then text = text.." "..args[i].."%"
    else text = args[i].."%" end
  end

  return text
end )
--}} CPU widget

-- {{ Date/time widget
mytextclock = awful.widget.textclock({ align = "right" })
-- datewidget = awful.widget.textbox()
-- vicious.register(datewidget, vicious.widgets.date, "%d/%m %T", 1)
-- "%d/%m %T"
-- }} Date/time widget

-- Create a systray
mysystray = wibox.widget.systray()

-- Create a status bar
--mystatusbar = awful.wibox({ position = "bottom", screen = 1, ontop = false, width = 1, height = 16 })


-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
)
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      if not c:isvisible() then
        awful.tag.viewonly(c:tags()[1])
      end
      -- This will also un-minimize
      -- the client, if needed
      client.focus = c
      c:raise()
    end
  end),
  awful.button({ }, 3, function ()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients({ width=250 })
    end
  end),
  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),
  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end))

for s = 1, screen.count() do
  -- Create a promptbox for each screen
  -- mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  mylayoutbox[s] = awful.widget.layoutbox(s)
  mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
    awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
  ))
    -- Create a taglist widget
  mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

  -- Create a tasklist widget
  mytasklist[s] = awful.widget.tasklist(function(c)
    return awful.widget.tasklist.label.currenttags(c, s)
  end, mytasklist.buttons)

  -- Create the wibox
  mywibox[s] = awful.wibox({ position = "top", screen = s })
  -- Add widgets to the wibox - order matters
  mywibox[s].widgets = {
    {
      mylauncher,
      mytaglist[s],
      mypromptbox[s],
      layout = awful.widget.layout.horizontal.leftright
    },
    mylayoutbox[s],
    s == 1 and mysystray or nil,
    -- mytextclock,
    datewidget, mytimeicon, middlespacer,
    tzfound and tzswidget or nil, myseparator,
    --baticon.image and separator, batwidget, baticon or nil, myseparator,
    memtext, membar, memwidget or nil, memicon, middlespacer,
    -- wirelessnetwidget,
    -- wirelessicon,
    -- wirenetwidget,
    -- wireicon,
    dnicon.image,  upicon, netwidget, dnicon or nil, middlespacer,
    cpuwidget, mycpuicon, leftspacer,
    -- myseparator, memwidget, mymemicon,
    mytasklist[s],
    layout = awful.widget.layout.horizontal.rightleft
  }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
  --awful.key({ modkey }, "v", treesome.vertical),
  --awful.key({ modkey }, "h", treesome.horizontal)
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

  awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end),

  -- Standard program
  awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
  awful.key({ modkey, "Control" }, "r", awesome.restart),
  awful.key({ modkey, "Shift"   }, "q", awesome.quit),

  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
  awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

  awful.key({ modkey, "Control" }, "n", awful.client.restore),

  -- Prompt
  awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

  awful.key({ modkey }, "x",
    function ()
      awful.prompt.run({ prompt = "Run Lua code: " },
      mypromptbox[mouse.screen].widget,
      awful.util.eval, nil,
      awful.util.getdir("cache") .. "/history_eval")
    end)
)

clientkeys = awful.util.table.join(
  awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
  awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
  awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
  awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
  awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
  awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
  awful.key({ modkey,           }, "n",
    function (c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end),
  awful.key({ modkey,           }, "m",
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c.maximized_vertical   = not c.maximized_vertical
    end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
  keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewonly(tags[screen][i])
        end
      end),
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewtoggle(tags[screen][i])
        end
      end),
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.movetotag(tags[client.focus.screen][i])
        end
      end),
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.toggletag(tags[client.focus.screen][i])
        end
      end)
    )
end

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = { border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = true,
      keys = clientkeys,
      buttons = clientbuttons } },
  { rule = { class = "vlc" },
    properties = { floating = true } },
  { rule = { class = "MPlayer" },
    properties = { floating = true } },
  { rule = { class = "pinentry" },
    properties = { floating = true } },
  { rule = { class = "gimp" },
    properties = { floating = true } },
  -- Set Firefox to always map on tags number 2 of screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { tag = tags[1][2] } },
}
--}}

--{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
  -- Add a titlebar
  -- awful.titlebar.add(c, { modkey = modkey })

  -- Enable sloppy focus
  c:add_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
      and awful.client.focus.filter(c) then
      client.focus = c
    end
  end)

  if not startup then
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- awful.client.setslave(c)

    -- Put windows in a smart way, only if they does not set an initial position.
    if not c.size_hints.user_position and not c.size_hints.program_position then
      awful.placement.no_overlap(c)
      awful.placement.no_offscreen(c)
      end
  end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
