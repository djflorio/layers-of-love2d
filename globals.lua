local genColor = function(r, g, b, a)
  a = a or 1
  return {r/255, g/255, b/255, a}
end

local themes = {
  easy = {
    background = genColor(93, 142, 84),
    player = genColor(56, 86, 51),
    floor = genColor(31, 48, 28),
    platform = genColor(31, 48, 28),
    platformCleared = genColor(51, 58, 50),
    hudText = genColor(204, 206, 204),
    hudBack = genColor(0, 0, 0, 0.8)
  },
  medium = {
    background = genColor(255, 142, 84),
    player = genColor(56, 86, 51),
    floor = genColor(31, 48, 28),
    platform = genColor(31, 48, 28),
    platformCleared = genColor(51, 58, 50),
    hudText = genColor(204, 206, 204),
    hudBack = genColor(0, 0, 0, 0.8)
  }
}

globals = {
  holeSize = 100,
  playerSpeed = 5,
  increasePercent = 1.05,
  layersPassed = 0,
  colors = themes.easy
}

globals.setMediumTheme = function()
  globals.colors = themes.medium
end

return globals