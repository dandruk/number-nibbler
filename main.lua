Gamestate = require "hump.gamestate"
menu = require "menu"
vector = require "hump.vector"
game = require "game"
Timer = require "hump.timer"
require "equality"

math.randomseed(os.time())


function love.load()
  line_width = 10
  Gamestate.registerEvents()
  love.graphics.setLineWidth(line_width)
  Gamestate.switch(menu)
  d = 0
  love.window.setMode(1280,720)
end

function love.update(dt)
  d=dt
  Timer.update(dt)
end

function love.draw()
end
