local bump = require 'lib.bump.bump'
local player = require 'parts.player'
local platforms = require 'parts.platforms'
local floor = require 'parts.floor'
local hud = require 'parts.hud'
local background = require 'parts.background'
local audio = require 'assets.audio'
local animations = require 'parts.animations'
local globals = require 'globals'
local gameover = require 'parts.gameover'
local fonts = require 'parts.fonts'

function love.load()
    world = bump.newWorld(16)
    fonts.init()
    globals.init()
    animations.init()
    floor.init(world)
    platforms.init(world)
    player.init(world)
    audio.init()
end

function love.update(dt)
    if globals.playing then
        player.update(dt)
        platforms.update(player, dt)
    elseif love.keyboard.isDown("return") then
        love.load()
    end
    animations.update()
end

function love.draw()
    local xOffset = 0
    local yOffset = -player.y + love.graphics.getHeight() - 170
    if animations.hurt.playing then
        xOffset = love.math.random(-10, 10)
        yOffset = yOffset + love.math.random(-10, 10)
    end
    love.graphics.translate(xOffset, yOffset)
    background.draw(yOffset)
    floor.draw()
    platforms.draw()
    player.draw()
    hud.draw(yOffset)
    if not globals.playing then
        gameover.draw(yOffset)
    end
end