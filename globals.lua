local genColor = function(r, g, b, a)
    local forWeb = false
    a = a or 1
    if forWeb then
        return {r, g, b, a*255}
    end
    return {r/255, g/255, b/255, a}
end

local themes = {
    easy = {
        primary = genColor(49, 71, 49),
        secondary = genColor(154, 224, 154),
        black = genColor(0, 0, 0, 0.9),
        hurt = genColor(244, 92, 66)
    },
    medium = {
        primary = genColor(104, 74, 19),
        secondary = genColor(239, 206, 141),
        black = genColor(0, 0, 0, 0.9),
        hurt = genColor(244, 92, 66)
    },
    hard = {
        primary = genColor(81, 30, 7),
        secondary = genColor(247, 140, 91),
        black = genColor(0, 0, 0, 0.9),
        hurt = genColor(244, 92, 66)
    },
    expert = {
        primary = genColor(255, 50, 50),
        secondary = genColor(0, 0, 0),
        black = genColor(0, 0, 0, 0.9),
        hurt = genColor(244, 92, 66)
    }
}

local globals = {}

globals.init = function()
    globals.holeSize = 100
    globals.playerSpeed = 5
    globals.playerHealth = 3
    globals.increasePercent = 1.05
    globals.layersPassed = 0
    globals.colors = themes.easy
    globals.playing = true
end

globals.setTheme = function(theme)
    if theme == 'medium' then
        globals.colors = themes.medium
    elseif theme == 'hard' then
        globals.colors = themes.hard
    elseif theme == 'expert' then
        globals.colors = themes.expert
    end
end

return globals