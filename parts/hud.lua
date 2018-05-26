local globals = require 'globals'

local hud = {}

hud.draw = function(offset)
  love.graphics.setColor(globals.colors.hudText)
  love.graphics.print(globals.layersPassed, 15, 15 - offset)
end

return hud