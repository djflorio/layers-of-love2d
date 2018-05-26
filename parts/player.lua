local globals = require 'globals'

local player = {
    w = 32,
    h = 32,
    x = 0,
    y = love.graphics.getHeight() - 42,
    xVelocity = globals.playerSpeed,
    yVelocity = 0,
    gravity = 100,
    friction = 5,
    jumpSpeed = 30,
    isGrounded = false,
    isJumping = false,
    hasReachedMax = false,
    jumpStart = 0,
    jumpMax = 150
}

player.filter = function(item, other)
    local x, y, w, h = world:getRect(other)
    local px, py, pw, ph = world:getRect(item)
    local playerBottom = py + ph
    local otherBottom = y + h

    if playerBottom <= y then
        return 'slide'
    end
end

player.init = function(world)
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
        elseif (goalX <= 0) then
            goalX = 0
            player.xVelocity = globals.playerSpeed
        end
    end
    local goalY = player.y + player.yVelocity

    player.yVelocity = player.yVelocity * (1 - math.min(dt * player.friction, 1))
    player.yVelocity = player.yVelocity + player.gravity * dt

    player.x, player.y, collisions = world:move(player, goalX, goalY)

    if love.keyboard.isDown("space") and not player.isJumping then
        player.isJumping = true
        player.jumpStart = player.y
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
            player.hasReachedMax = true
            player.isGrounded = false
            print("OUCH")
        elseif coll.normal.y < 0 then
            player.hasReachedMax = false
            player.isJumping = false
            player.isGrounded = true
        end
    end
end

player.draw = function()
    love.graphics.setColor(globals.colors.player)
    love.graphics.rectangle(
        'fill',
        player.x,
        player.y,
        player.w,
        player.h
    )
end

return player