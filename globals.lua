local genColor = function(r, g, b)
  return {r/255, g/255, b/255}
end

globals = {
  holeSize = 100,
  playerSpeed = 5,
  increasePercent = 1.05,
  layersPassed = 0,
  colors = {
    background = genColor(93, 142, 84),
    player = genColor(56, 86, 51),
    floor = genColor(31, 48, 28),
    platform = genColor(31, 48, 28),
    platformCleared = genColor(51, 58, 50),
    hudText = genColor(204, 206, 204)
  }
}

return globals