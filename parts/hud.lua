local globals = require 'globals'

local hud = {}

hud.draw = function(offset)
  love.graphics.setColor(globals.colors.hudBack)
  love.graphics.rectangle('fill', 0, -offset, love.graphics.getWidth(), 30)
  love.graphics.setColor(globals.colors.hudText)
  local cleared = "Cleared: " .. tostring(globals.layersPassed)
  love.graphics.print(cleared, 6, 6 - offset)
end

return hud