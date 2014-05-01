
-- LOAD FUNCTIONS --

function loadWorld( roadNum , imgNum )
         loadRoad( roadNum , imgNum )

end


-- DRAW FUNCTIONS --

function drawWorld()
         drawRoad()
end


-- UPDATE FUNCTIONS --

function updateWorld(dt)
   updateRoad(dt)
   dir = ''

   if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
        increaseSpeed()
   elseif love.keyboard.isDown('down') or love.keyboard.isDown('s') then
        decreaseSpeed()
   else
       stopSpeed()
   end
   
   if love.keyboard.isDown('left') then
        dir = 'left'
   elseif love.keyboard.isDown('right') then
        dir = 'right'
   end

   moveRoad(dir)
   movePlayer(dt)

end