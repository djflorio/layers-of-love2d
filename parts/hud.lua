local globals = require 'globals'
local fonts = require 'parts.fonts'

local hud = {}

hud.draw = function(offset)
  love.graphics.setFont(fonts.big)
  love.graphics.setColor(globals.colors.primary)
  local cleared = globals.layersPassed
  love.graphics.print(cleared, 10, -5 - offset)
  for h=1,globals.playerHealth do
    local size = 30
    local spacing = 5
    local start = love.graphics.getWidth() - (size + 2*spacing + 4*size)
    love.graphics.rectangle('fill', start + (size+spacing)*h, 20-offset, size, size)
  end
end

return hud