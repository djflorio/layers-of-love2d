local audio = {}

audio.init = function()
    audio.wallhit = love.audio.newSource("/assets/sounds/wallhit.wav", "static")
    audio.jump = love.audio.newSource("/assets/sounds/jump.wav", "static")
    audio.pass = love.audio.newSource("/assets/sounds/pass.wav", "static")
    audio.land = love.audio.newSource("/assets/sounds/land.wav", "static")
end

return audio