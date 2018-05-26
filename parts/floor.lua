local floor = {
  x = 0,
  y = love.graphics.getHeight() - 10,
  w = love.graphics.getWidth(),
  h = 10
}

floor.init = function(world)
  world:add(floor, floor.x, floor.y, floor.w, floor.h)
end

floor.draw = function()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle(
      'fill',
      floor.x, floor.y, floor.w, floor.h
  )
end

return floor