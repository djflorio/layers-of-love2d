local Class = require 'lib.hump.class'
local globals = require 'globals'

local Platform = Class{}

function Platform:init(world, y, holeStart, holeWidth)
    self.h = 10
    self.p1 = {
        x = 0,
        y = y,
        w = holeStart,
        h = self.h
    }
    self.p2 = {
        x = holeStart + holeWidth,
        y = y,
        w = love.graphics.getWidth() - (holeStart + holeWidth),
        h = self.h
    }
    self.full = {
        x = self.p1.x,
        y = self.p1.y,
        w = love.graphics.getWidth(),
        h = self.h
    }
    self.closed = false
    self.world = world

    self.world:add(self.p1, self.p1.x, self.p1.y, self.p1.w, self.p1.h)
    self.world:add(self.p2, self.p2.x, self.p2.y, self.p2.w, self.p2.h)
end

function Platform:update(p, player, onClear, dt)
    if (player.y + player.h) < (p.p1.y - p.h) then
        if not p.closed then
            p.closed = true
            p.world:add(
                p.full,
                p.full.x,
                p.full.y,
                p.full.w,
                p.full.h
            )
            p.world:remove(p.p1)
            p.world:remove(p.p2)

            onClear()
        end
    end
end

function Platform:draw(p)
    if not p.closed then
        love.graphics.setColor(globals.colors.primary)
        love.graphics.rectangle(
            'fill',
            p.p1.x,
            p.p1.y,
            p.p1.w,
            p.p1.h
        )
        love.graphics.rectangle(
            'fill',
            p.p2.x,
            p.p2.y,
            p.p2.w,
            p.p2.h
        )
    else
        love.graphics.setColor(globals.colors.primary)
        love.graphics.rectangle(
            'fill',
            p.full.x,
            p.full.y,
            p.full.w,
            p.full.h
        )
    end
end

return Platform