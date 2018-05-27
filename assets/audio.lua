local audio = {}

audio.init = function()
    audio.jump = love.audio.newSource("/assets/sounds/jump.wav", "static")
    audio.jump:setVolume(0.5)
    audio.pass = love.audio.newSource("/assets/sounds/pass.wav", "static")
    audio.pass:setVolume(0.5)
    audio.land = love.audio.newSource("/assets/sounds/land.wav", "static")
    audio.land:setVolume(0.5)
    audio.hurt = love.audio.newSource("/assets/sounds/hurt.wav", "static")
    audio.hurt:setVolume(0.5)
end

return audio