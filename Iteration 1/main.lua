function love.load()
    require("screen")
    require("game/images")
    require("game/player")
    require("game/world")
    require("game/road")
    require("game/data/circuit")

    love.graphics.setBackgroundColor( 152, 204, 87 )

    loadScreen()
    loadImages()
    loadPlayer()
    
    loadRoad( 1, 2 )

end

function love.update(dt)
    updateWorld(dt)
    movePlayer(dt)
end

function love.draw()
--    drawAxis()
    drawWorld()
    drawPlayer()
end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
         if key == 'r' then
            love.load()
         end

end

function love.keyreleased(key, unicode)
end

function love.focus(f)
end

function love.quit()
end


-- UTILS --

function insideBox (px, py, x, y, wx, wy)
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end

function getDistance( x1, y1, x2, y2 )
   xDiff = x2 - x1
   yDiff = y2 - y1
   return math.sqrt( (xDiff*xDiff) + (yDiff*yDiff) )
end

function getAngle( x1, y1, x2, y2 )
   xDiff = x2 - x1
   yDiff = y2 - y1
   return math.atan2(yDiff, xDiff)
end

function degree2Radian( n )
   return n * (math.pi/180)
end