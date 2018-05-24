bump = require 'lib.bump.bump'
local player = require 'parts.player'
local platforms = require 'parts.platforms'
local Platform = require 'parts.platform'

local floor = {
    x = 0,
    y = love.graphics.getHeight() - 10,
    w = love.graphics.getWidth(),
    h = 10
}

function love.load()
    world = bump.newWorld(16)
    world:add(player, player.x, player.y, player.w, player.h)
    world:add(floor, floor.x, floor.y, floor.w, floor.h)
    platforms.init(world)
end

function love.update(dt)
    player.update(dt)
    platforms.update(player, dt)
end

function love.draw()
    love.graphics.translate(0, -player.y + love.graphics.getHeight() - 200)
    platforms.draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle(
        'fill',
        floor.x, floor.y, floor.w, floor.h
    )
    player.draw()
end