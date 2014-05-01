player = {
          coord = { x = 0, y = 0 },
          mov = { vel = 20, acc = 0, h = 30},
          img = nil,


         }


-- LOAD FUNCTIONS --

function loadPlayer()
     player.coord.x = screen.center.x - player.img:getWidth()/2
     player.coord.y = screen.center.y - player.img:getHeight()/2
     player.mov.acc = 0
end


-- DRAW FUNCTIONS --

function drawPlayer()
   love.graphics.draw(player.img, player.coord.x, player.coord.y)
end


-- UPDATE FUNCTIONS --

function movePlayer(dt)
   if love.keyboard.isDown('a') then
        player.coord.x = player.coord.x - dt*player.mov.h*player.mov.acc
         
   elseif love.keyboard.isDown('d') then
        player.coord.x = player.coord.x + dt*player.mov.h*player.mov.acc
   end
end


function increaseSpeed()
   if ( player.mov.acc < 1 ) then player.mov.acc = player.mov.acc + 0.01 end
end

function decreaseSpeed()
   if ( player.mov.acc > -1 ) then player.mov.acc = player.mov.acc - 0.01 end
end

function stopSpeed()

   if( player.mov.acc < 0.1 and player.mov.acc > -0.1) then player.mov.acc = 0
   elseif ( player.mov.acc > 0 ) then player.mov.acc = player.mov.acc - 0.008
   elseif ( player.mov.acc < 0 ) then player.mov.acc = player.mov.acc + 0.008 end
end
