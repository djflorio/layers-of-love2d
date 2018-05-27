local globals = require 'globals'

local hud = {}

hud.draw = function(offset)
  --love.graphics.setColor(globals.colors.hudBack)
  --love.graphics.rectangle('fill', 0, -offset, love.graphics.getWidth(), 30)
  love.graphics.setColor(globals.colors.primary)
  local cleared = "Cleared: " .. tostring(globals.layersPassed)
  love.graphics.print(cleared, 6, 6 - offset)
  for h=1,globals.playerHealth do
    love.graphics.rectangle('fill', 200 + 12*h, 10-offset, 10, 10)
  end
end

return hud