hs.hotkey.bind(hyper, 'return', function ()
  for k,v in pairs(hs.application.runningApplications()) do
    if v:name():find('^iTerm') ~= nil then
      if next(v:allWindows()) == nil then
        hs.application.open('iTerm')
      else
        v:activate()
        hs.eventtap.keyStroke({'cmd'}, 'n')
      end
    else
      hs.application.open('iTerm')
    end
  end
end)

