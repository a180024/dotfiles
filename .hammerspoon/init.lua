local hyper = { "cmd", "alt", "ctrl", "shift" } 

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

function baseMove(x, y, w, h)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.w * x + max.x
    f.y = max.h * y
    f.w = max.w * w
    f.h = max.h * h
    win:setFrame(f, 0)
  end
end

hs.hotkey.bind(hyper, 'h', baseMove(0, 0, 0.5, 1))
hs.hotkey.bind(hyper, 'l', baseMove(0.5, 0, 0.5, 1))
hs.hotkey.bind(hyper, 'j', baseMove(0, 0.5, 1, 0.5))
hs.hotkey.bind(hyper, 'k', baseMove(0, 0, 1, 0.5))
hs.hotkey.bind(hyper, '1', baseMove(0, 0, 0.5, 0.5))
hs.hotkey.bind(hyper, '2', baseMove(0.5, 0, 0.5, 0.5))
hs.hotkey.bind(hyper, '3', baseMove(0, 0.5, 0.5, 0.5))
hs.hotkey.bind(hyper, '4', baseMove(0.5, 0.5, 0.5, 0.5))

hs.hotkey.bind(hyper, "g", function() 
  local win = hs.window.focusedWindow(); 
  if not win then 
  return end win:moveToUnit(hs.layout.maximized) 
end)

hs.window.animationDuration = 0

local applicationHotkeys = {
  c = 'Google Chrome',
  s = 'Safari'
  t = 'iTerm',
  x = 'Slack',
  m = 'Spotify',
  p = 'Postman',
  o = 'Microsoft Outlook'
}
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end


