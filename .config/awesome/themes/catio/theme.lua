-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}

home = os.getenv("HOME")
config = awful.util.getdir("config")
shared = "/usr/share/awesome"

if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
  shared = "/usr/share/local/awesome"
end

sharedicons = shared .. "/icons"
sharedthemes = shared .. "/themes"
themes = config .. "/themes"

themename = "/catio"
themedir = themes .. themename
iconsdir = themedir .. "/icons"

theme.wallpaper_cmd = { "awsetbg -u feh -a " .. themedir .. "/catio.png" }
-- }}}

-- {{{ Styles
theme.font      = "sans 9"
local orange = "#FFC100"
local green = "#00FF00"
local gray = "#3F3F3F"
local white = "#FFFFFF"

-- {{{ Colors
theme.fg_normal = "#DCDCCC"
--theme.fg_focus  = "#000000"
theme.fg_focus  = white
theme.fg_urgent = "#CC9393"
theme.bg_normal = gray
--theme.bg_focus  = "#00FF00"
theme.bg_focus  = gray
theme.bg_urgent = "#3F3F3F"
-- }}}

-- {{{ Borders
theme.border_width  = "2"
theme.border_normal = gray
--theme.border_normal = "#33FF00"
theme.border_focus  = orange
--theme.border_focus  = "#FF9900"
--theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_bg_focus  = orange
theme.tasklist_bg_focus  = orange
--theme.tasklist_bg_focus = "#CC9393"

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
theme.menu_height = "20"
theme.menu_width  = "120"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themedir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = themedir .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themedir .. "/awesome-icon.png"
theme.menu_submenu_icon      = themedir .. "/submenu.png"
theme.tasklist_floating_icon = themedir .. "/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themedir .. "/layouts/tile.png"
theme.layout_tileleft   = themedir .. "/layouts/tileleft.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottom.png"
theme.layout_tiletop    = themedir .. "/layouts/tiletop.png"
theme.layout_fairv      = themedir .. "/layouts/fairv.png"
theme.layout_fairh      = themedir .. "/layouts/fairh.png"
theme.layout_spiral     = themedir .. "/layouts/spiral.png"
theme.layout_dwindle    = themedir .. "/layouts/dwindle.png"
theme.layout_max        = themedir .. "/layouts/max.png"
theme.layout_fullscreen = themedir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themedir .. "/layouts/magnifier.png"
theme.layout_floating   = themedir .. "/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themedir .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themedir .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = themedir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themedir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themedir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themedir .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themedir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themedir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themedir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themedir .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themedir .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themedir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themedir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themedir .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themedir .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themedir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themedir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themedir .. "/titlebar/maximized_normal_inactive.png"
-- }}}
-- {{{ Networl icons
theme.wireless_net = themedir .. "/net/network-wireless.png"
theme.wire_net = themedir .. "/net/network-wired-activated.png"

theme.widget_bat   = iconsdir .. "/bat.png"
theme.widget_cpu   = iconsdir .. "/cpu.png"
theme.widget_disk  = iconsdir .. "/disk.png"
theme.widget_down  = iconsdir .. "/down.png"
theme.widget_disk  = iconsdir .. "/disk.png"
theme.widget_mem   = iconsdir .. "/mem.png"
theme.widget_music = iconsdir .. "/music.png"
theme.widget_time  = iconsdir .. "/time.png"
theme.widget_up    = iconsdir .. "/up.png"
theme.widget_vol   = iconsdir .. "/vol.png"
-- }}}

return theme
