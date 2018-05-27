local globals = require 'globals'
local fonts = require 'parts.fonts'

local gameover = {}

gameover.draw = function(offset)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(globals.colors.black)
    love.graphics.rectangle(
        'fill',
        0,
        0 - offset,
        love.graphics.getWidth(),
        love.graphics.getHeight()
    )
    local w = love.graphics.getWidth()
    love.graphics.setColor(globals.colors.white)
    love.graphics.printf("GAME OVER", 0, 170 - offset, w, "center")
    love.graphics.setFont(fonts.medium)
    love.graphics.printf(
        "Layers Passed: " .. tostring(globals.layersPassed),
        0,
        240 - offset,
        w,
        "center"
    )
    love.graphics.printf(
        "Press ENTER to try again",
        0,
        270 - offset,
        w,
        "center"
    )
end

return gameover