local hyper = { "cmd", "alt", "ctrl", "shift" } 
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

hs.window.animationDuration = 0

hs.hotkey.bind(hyper, "h", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "j", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind(hyper, "k", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)

hs.hotkey.bind(hyper, "l", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.right50)
end)

local applicationHotkeys = {
  c = 'Google Chrome',
  t = 'iTerm',
  s = 'Spotify',
  v = 'Visual Studio Code'
}
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end



