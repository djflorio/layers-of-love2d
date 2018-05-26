local globals = require('globals')

local Platform = require 'parts.Platform'

local settings = {
    holeSize = 100
}

local platforms = {}

local function addPlatform()
    local topY = platforms[#platforms].p1.y
    local w = love.graphics.getWidth()
    local start = love.math.random(10, w - settings.holeSize)
    platforms[#platforms+1] = Platform(world, topY - 200, start, settings.holeSize)
    if (#platforms > 5) then
        table.remove(platforms, 1)
    end
    globals.playerSpeed = globals.playerSpeed * 1.1
    print(globals.playerSpeed)
end

platforms.init = function(world)
    for i=1, 2 do
        local w = love.graphics.getWidth()
        local hSize = settings.holeSize
        local hStart = love.math.random(10, w - hSize)
        local y = love.graphics.getHeight() - (200 * i)
        platforms[i] = Platform(world, y, hStart, hSize)
    end
end

platforms.update = function(player, dt)
    for i=1, #platforms do
        Platform:update(platforms[i], player, addPlatform, dt)
    end
end

platforms.draw = function()
    for i=1, #platforms do
        Platform:draw(platforms[i])
    end
end

return platforms