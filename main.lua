local bump = require 'lib.bump.bump'
local player = require 'parts.player'
local platforms = require 'parts.platforms'
local floor = require 'parts.floor'

function love.load()
    world = bump.newWorld(16)
    floor.init(world)
    platforms.init(world)
    player.init(world)
end

function love.update(dt)
    player.update(dt)
    platforms.update(player, dt)
end

function love.draw()
    love.graphics.translate(0, -player.y + love.graphics.getHeight() - 200)
    floor.draw()
    platforms.draw()
    player.draw()
end