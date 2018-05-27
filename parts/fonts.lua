local fonts = {}

fonts.init = function()
    fonts.big = love.graphics.newFont("assets/fonts/OpenSans-ExtraBold.ttf", 50)
    fonts.medium = love.graphics.newFont("assets/fonts/OpenSans-ExtraBold.ttf", 25)
end

return fonts