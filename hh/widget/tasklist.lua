local awful        = require("awful")

result = {}

-- -- Create a wibox for each screen and add it
result.buttons = awful.util.table.join(
  awful.button({ }, 1, function (c)
      if c == client.focus then
        c.minimized = true
      else
        -- Without this, the following
        -- :isvisible() makes no sense
        c.minimized = false
        if not c:isvisible() then
          awful.tag.viewonly(c:tags()[1])
        end
        -- This will also un-minimize
        -- the client, if needed
        client.focus = c
        c:raise()
      end
  end),
  awful.button({ }, 3, function (c)
      client.focus = c
      c:raise()
end))


for s = 1, screen.count() do
  result[s] = {}
  result[s].widget = awful.widget.tasklist(
    s, awful.widget.tasklist.filter.currenttags, result.buttons)
end

return result
