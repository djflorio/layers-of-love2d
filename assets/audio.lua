local audio = {}

audio.init = function()
    audio.jump = love.audio.newSource("/assets/sounds/jump.wav", "static")
    audio.pass = love.audio.newSource("/assets/sounds/pass.wav", "static")
    audio.land = love.audio.newSource("/assets/sounds/land.wav", "static")
    audio.hurt = love.audio.newSource("/assets/sounds/hurt.wav", "static")
end

return audio