local pressed = {
  up = false,
  down = false,
  left = false,
  right = false
}

hs.hotkey.bind(hyper, "return", function ()
  local a = hs.application.get(TERMINAL)
  if a ~= nil then
    a:selectMenuItem({"Shell", "New Window"})
  else
    hs.application.open(TERMINAL)
  end
end)

hs.hotkey.bind(ultra, "up", function ()
  pressed.up = true
  if pressed.down then 
    fullDimension("h")
  else
    reposition("up")
  end
end, function () 
  pressed.up = false
end)

hs.hotkey.bind(ultra, "down", function ()
  pressed.down = true
  if pressed.up then 
    fullDimension("h")
  else
    reposition("down")
  end
end, function () 
  pressed.down = false
end)

hs.hotkey.bind(ultra, "left", function ()
  pressed.left = true
  if pressed.right then 
    fullDimension("w")
  else
    reposition("left")
  end
end, function () 
  pressed.left = false
end)

hs.hotkey.bind(ultra, "right", function ()
  pressed.right = true
  if pressed.left then 
    fullDimension("w")
  else
    reposition("right")
  end
end, function () 
  pressed.right = false
end)

hs.hotkey.bind(ultra, "s", function ()
  hs.caffeinate.lockScreen()
end)

hs.hotkey.bind(ultra, "f", function ()
  fullscreen()
end)

hs.hotkey.bind(ultra, "a", function ()
  hs.grid.show()
end)

hs.hotkey.bind(hyper, "up", function ()
  hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(hyper, "down", function ()
  hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(hyper, "left", function ()
  hs.window.focusedWindow():focusWindowWest()
end)

hs.hotkey.bind(hyper, "right", function ()
  hs.window.focusedWindow():focusWindowEast()
end)
