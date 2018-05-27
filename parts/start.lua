local globals = require 'globals'
local fonts = require 'parts.fonts'

local start = {}

start.draw = function(offset)
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
    love.graphics.printf("Layers of LÖVE", 0, 170 - offset, w, "center")
    love.graphics.setFont(fonts.medium)
    love.graphics.printf("by Dan Florio", 0, 230 - offset, w, "center")
    local message = "Press ENTER to start"
    love.graphics.printf(message, 0, 340 - offset, w, "center")
    love.graphics.setFont(fonts.small)
    local message = "Press SPACE to make the square jump"
    love.graphics.printf(message, 0, 280 - offset, w, "center")
    local message = "Aim for the openings"
    love.graphics.printf(message, 0, 300 - offset, w, "center")
end

return start