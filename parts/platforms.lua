local globals = require 'globals'
local Platform = require 'parts.Platform'
local audio = require 'assets.audio'

local platforms = {}

local function addPlatform()
    audio.pass:play()
    local topY = platforms[#platforms].p1.y
    local w = love.graphics.getWidth()
    local start = love.math.random(10, w - globals.holeSize)
    platforms[#platforms+1] = Platform(world, topY - 200, start, globals.holeSize)
    if (#platforms > 5) then
        table.remove(platforms, 1)
    end
    globals.playerSpeed = globals.playerSpeed * globals.increasePercent
    globals.layersPassed = globals.layersPassed + 1
    if (globals.layersPassed == 10) then
        globals.setTheme('medium')
    end
    if (globals.layersPassed == 20) then
        globals.setTheme('hard')
    end
    if (globals.layersPassed == 30) then
        globals.setTheme('expert')
    end
end

platforms.init = function(world)
    platforms = {}
    for i=1, 2 do
        local w = love.graphics.getWidth()
        local hSize = globals.holeSize
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