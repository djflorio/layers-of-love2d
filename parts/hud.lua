local globals = require 'globals'

local hud = {}

hud.draw = function(offset)
  love.graphics.setColor(0, 255, 255)
  love.graphics.print(globals.layersPassed, 15, 15 - offset)
end

return hud