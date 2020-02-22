hs.grid.ui.showExtraKeys = false

hs.grid.setGrid(GRID.w .. "x" .. GRID.h)
hs.grid.setMargins(hs.geometry.size(GRID_MARGIN.w, GRID_MARGIN.h))

function reposition(direction)
  if hs.window.focusedWindow() then
    local window = hs.window.frontmostWindow()
    local screen = window:screen()

    local cell = hs.grid.get(window, screen)

    if direction == "up" then
      if cell["y"] ~= 0 then
        hs.grid.set(window, hs.geometry.rect(cell["x"], 0, cell["w"], cell["h"]), screen)
      elseif cell["h"] == GRID["h"] then
        hs.grid.set(window, hs.geometry.rect(cell["x"], 0, cell["w"], 1), screen)
      else
        hs.grid.resizeWindowTaller(window)
      end
    elseif direction == "down" then
      if cell["y"] ~= GRID["h"] - cell["h"] then
        print(cell["x"], GRID["h"] - cell["h"], cell["w"], cell["h"])
        hs.grid.set(window, hs.geometry.rect(cell["x"], GRID["h"] - cell["h"], cell["w"], cell["h"]), screen)
      elseif cell["h"] == GRID["h"] then
        hs.grid.set(window, hs.geometry.rect(cell["x"], GRID["h"] - 1, cell["w"], 1), screen)
      else
        hs.grid.resizeWindowTaller(window)
      end
    elseif direction == "left" then
      if cell["x"] ~= 0 then
        hs.grid.set(window, hs.geometry.rect(0, cell["y"], cell["w"], cell["h"]), screen)
      elseif cell["w"] == GRID["w"] then
        hs.grid.set(window, hs.geometry.rect(0, cell["y"], 1, cell["h"]), screen)
      else
        hs.grid.resizeWindowWider(window)
      end
    elseif direction == "right" then
      if cell["x"] ~= GRID["w"] - cell["w"] then
        hs.grid.set(window, hs.geometry.rect(GRID["w"] - cell["w"], cell["y"], cell["w"], cell["h"]), screen)
      elseif cell["w"] == GRID["w"] then
        hs.grid.set(window, hs.geometry.rect(GRID["w"] - 1, cell["y"], 1, cell["h"]), screen)
      else
        hs.grid.resizeWindowWider(window)
      end
    end

  end
end

function fullscreen()
  if hs.window.focusedWindow() then
    local window = hs.window.frontmostWindow()
    local screen = window:screen()
    hs.grid.set(window, hs.geometry.rect(0, 0, GRID.w, GRID.h), screen)
  end
end

function fullDimension(dimension)
  if hs.window.focusedWindow() then
    local window = hs.window.frontmostWindow()
    local screen = window:screen()

    local cell = hs.grid.get(window, screen)
    local newCell

    if (dimension == "h") then
      newCell = hs.geometry.rect(cell["x"], 0, cell["w"], GRID["h"])
    else  
      newCell = hs.geometry.rect(0, cell["y"], GRID["w"], cell["h"])
    end

    hs.grid.set(window, newCell, screen)
  end
end