local genColor = function(r, g, b, a)
    a = a or 1
    return {r/255, g/255, b/255, a}
end

local themes = {
    easy = {
        primary = genColor(49, 71, 49),
        secondary = genColor(154, 224, 154)
    },
    medium = {
        primary = genColor(104, 74, 19),
        secondary = genColor(239, 206, 141)
    },
    hard = {
        primary = genColor(81, 30, 7),
        secondary = genColor(247, 140, 91)
    },
    expert = {
        primary = genColor(255, 50, 50),
        secondary = genColor(0, 0, 0)
    }
}

local globals = {
    holeSize = 100,
    playerSpeed = 5,
    playerHealth = 3,
    increasePercent = 1.05,
    layersPassed = 0,
    colors = themes.easy
}

globals.setTheme = function(level)
    if level == 'medium' then
        globals.colors = themes.medium
    elseif level == 'hard' then
        globals.colors = themes.hard
    elseif level == 'expert' then
        globals.colors = themes.expert
    end
end

return globals