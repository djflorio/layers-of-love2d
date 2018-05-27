local globals = require 'globals'
local audio = require 'assets.audio'
local animations = require 'parts.animations'

local player = {}

player.init = function(world)
    globals.playerHealth = 3
    player.w = 32
    player.h = 32
    player.x = 0
    player.y = love.graphics.getHeight() - 42
    player.xVelocity = globals.playerSpeed
    player.yVelocity = 0
    player.gravity = 100
    player.friction = 5
    player.jumpSpeed = 30
    player.isGrounded = true
    player.isJumping = false
    player.hasReachedMax = false
    player.jumpStart = 0
    player.jumpMax = 150
    world:add(player, player.x, player.y, player.w, player.h)
end

player.update = function(dt)
    local goalX
    if not player.isGrounded then
        goalX = player.x
    else
        goalX = player.x + player.xVelocity
        if (goalX >= love.graphics.getWidth() - player.w) then
            goalX = love.graphics.getWidth() - player.w
            player.xVelocity = -globals.playerSpeed
            audio.land:play()
        elseif (goalX <= 0) then
            goalX = 0
            player.xVelocity = globals.playerSpeed
            audio.land:play()
        end
    end
    local goalY = player.y + player.yVelocity

    player.yVelocity = player.yVelocity * (1 - math.min(dt * player.friction, 1))
    player.yVelocity = player.yVelocity + player.gravity * dt

    player.x, player.y, collisions = world:move(player, goalX, goalY)

    if love.keyboard.isDown("space") and not player.isJumping then
        player.isJumping = true
        player.jumpStart = player.y
        audio.jump:play()
    end

    if player.isJumping and not player.hasReachedMax then
        local hasReachedMax = (player.jumpStart - player.y >= player.jumpMax)
        if not hasReachedMax then
            player.yVelocity = -player.jumpSpeed
        else
            player.hasReachedMax = true
        end
        player.isGrounded = false
    end

    for i, coll in ipairs(collisions) do
        if coll.touch.y > goalY then
            if player.hasReachedMax == false then
                audio.hurt:play()
                animations.hurt.playing = true
                animations.hurt.startTime = os.clock()
                player.hasReachedMax = true
                player.isGrounded = false
                globals.playerHealth = globals.playerHealth - 1
                if globals.playerHealth <= 0 then
                    globals.playing = false
                end
            end

        elseif coll.normal.y < 0 then
            player.hasReachedMax = false
            player.isJumping = false
            if not player.isGrounded then
                audio.land:play()
            end
            player.isGrounded = true
        end
    end
end

player.draw = function()
    if animations.hurt.playing then
        love.graphics.setColor(globals.colors.hurt)
    else
        love.graphics.setColor(globals.colors.primary)
    end
    love.graphics.rectangle(
        'fill',
        player.x,
        player.y,
        player.w,
        player.h
    )
end

return player