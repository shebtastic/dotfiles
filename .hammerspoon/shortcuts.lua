hs.hotkey.bind(hyper, 'return', function ()
  for k,v in pairs(hs.application.runningApplications()) do
    if v:name():find('^iTerm') ~= nil then
      v:selectMenuItem({"Shell", "New Window"})
    else
      hs.application.open('iTerm')
    end
  end
end)

