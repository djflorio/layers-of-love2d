local genColor = function(r, g, b, a)
    a = a or 1
    return {r/255, g/255, b/255, a}
end

local themes = {
    easy = {
        background = genColor(154, 224, 154),
        player = genColor(56, 86, 51),
        floor = genColor(49, 71, 49),
        platform = genColor(49, 71, 49),
        platformCleared = genColor(49, 71, 49),
        hudText = genColor(185, 232, 185),
        hudBack = genColor(0, 0, 0)
    },
    medium = {
        background = genColor(239, 206, 141),
        player = genColor(140, 104, 35),
        floor = genColor(104, 74, 19),
        platform = genColor(104, 74, 19),
        platformCleared = genColor(104, 74, 19),
        hudText = genColor(232, 207, 162),
        hudBack = genColor(0, 0, 0)
    },
    hard = {
        background = genColor(247, 140, 91),
        player = genColor(140, 53, 14),
        floor = genColor(81, 30, 7),
        platform = genColor(81, 30, 7),
        platformCleared = genColor(81, 30, 7),
        hudText = genColor(237, 194, 175),
        hudBack = genColor(0, 0, 0, 0.8)
    }
}

local globals = {
    holeSize = 100,
    playerSpeed = 5,
    increasePercent = 1.05,
    layersPassed = 0,
    colors = themes.easy
}

globals.setTheme = function(level)
    if level == 'medium' then
        globals.colors = themes.medium
    elseif level == 'hard' then
        globals.colors = themes.hard
    end
end

return globals