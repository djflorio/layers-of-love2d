local globals = require 'globals'

local background = {
  x = 0,
  y = 0,
  w = love.graphics.getWidth(),
  h = love.graphics.getHeight()
}

background.draw = function(offset)
  love.graphics.setColor(globals.colors.background)
  love.graphics.rectangle(
    'fill',
    background.x,
    background.y - offset,
    background.w,
    background.h
  )
end

return background