local bump = require 'lib.bump.bump'
local player = require 'parts.player'
local platforms = require 'parts.platforms'
local floor = require 'parts.floor'
local hud = require 'parts.hud'
local background = require 'parts.background'

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
    local offset = -player.y + love.graphics.getHeight() - 200
    love.graphics.translate(0, offset)
    background.draw(offset)
    floor.draw()
    platforms.draw()
    player.draw()
    hud.draw(offset)
end