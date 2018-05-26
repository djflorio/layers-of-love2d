local globals = require 'globals'

local hud = {}

hud.draw = function(offset)
  love.graphics.setColor(globals.colors.hudText)
  local cleared = "Cleared: " .. tostring(globals.layersPassed)
  love.graphics.print(cleared, 15, 15 - offset)
end

return hud