local animations = {}

animations.init = function()
    animations.hurt = {
        duration = 0.01,
        startTime = 0,
        playing = false
    }
end

animations.update = function()
    if animations.hurt.playing then
        local passed = os.clock() - animations.hurt.startTime
        if passed >= animations.hurt.duration then
            animations.hurt.playing = false
        end
    end
end

return animations