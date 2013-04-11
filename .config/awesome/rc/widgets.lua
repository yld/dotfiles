-- {{ CPU widget
local cpuwidget = widget({ type = "textbox" })

vicious.register(cpuwidget, vicious.widgets.cpu,
function (widget, args)
  local text
  -- list only real cpu cores
  for i=1,#args do
    -- alerts, if system is stressed
    if args[i] > 50 then
      -- from light green to light red
      local color = gradient("#AECF96","#FF5656",50,100,args[i])
      args[i] = string.format("<span color='%s'>%s</span>", color, args[i])
    end

    -- append to list
    if i > 2 then text = text.."/"..args[i].."%"
    else text = args[i].."%" end
  end

  return text
end )
--}} CPU widget

-- {{ Date/time widget
mytextclock = awful.widget.textclock({ align = "right" })
datewidget = widget({ type = "textbox" })
vicious.register(datewidget, vicious.widgets.date, date_format, 1)
-- "%d/%m %T"
-- }} Date/time widget

