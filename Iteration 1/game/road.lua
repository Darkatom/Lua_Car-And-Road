
road = {
         n = 0,      -- circuit type number
         c = 0,      -- circuit
         cf = 1,     -- index of the first index to be drawn
         cl = 0,     -- index of the last index to be drawn
       }


-- LOAD FUNCTIONS --

function loadRoad( roadNum , imgNum )
      road.n = imgNum
      road.c = loadCircuit( roadNum )
      road.cl = #road.c

      initiatePositions()
      updateDistances()
      updateAngles()
end

function initiatePositions()
   local imgh = 0
   local xo = 0
   local yo = screen.height
   local cont = 0
   local last = ''

   for i = 1, #road.c.p do

      imgh = images.road.types[road.n][road.c.p[i].iNum]:getHeight()
      xo = screen.center.x - (images.road.types[road.n][road.c.p[i].iNum]:getWidth()/2)

   --[[    if last ~= road.c.p[i].dir then
         cont = 1
         last = road.c.p[i].dir
      else
          cont = cont + 1
      end --]]

      if road.c.p[i].dir == 'tru' then
          road.c.p[i].x = road.c.p[i-1].x
          road.c.p[i].y = road.c.p[i-1].y - imgh
          road.c.p[i].rr = 0
      elseif road.c.p[i].dir == 'tlu' then
          road.c.p[i].x = road.c.p[i-1].x - (images.road.types[road.n][road.c.p[i].iNum]:getWidth() - images.road.types[road.n][road.c.p[i-1].iNum]:getWidth())
          road.c.p[i].y = road.c.p[i-1].y - imgh
          road.c.p[i].rr = 0
      elseif road.c.p[i].dir == 'sl' then
          if road.c.p[i].dir ~= road.c.p[i-1].dir then road.c.p[i].x = road.c.p[i-1].x
          else road.c.p[i].x = road.c.p[i-1].x - imgh end
          road.c.p[i].y = road.c.p[i-1].y
          road.c.p[i].rr = degree2Radian( 90 )
      elseif road.c.p[i].dir == 'su' then
          road.c.p[i].x = xo
          road.c.p[i].y = yo - imgh
          road.c.p[i].rr = 0
      end
      
      yo = road.c.p[i].y

   end
end


-- DRAW FUNCTIONS --

function drawRoad()
   for i = 1, #road.c.p do
      love.graphics.draw(images.road.types[road.n][road.c.p[i].iNum], road.c.p[i].x, road.c.p[i].y, road.c.p[i].ro + road.c.p[i].rr)
--      love.graphics.circle('fill', road.c.p[i].x, road.c.p[i].y, 15, 8 )
   end
end




-- UPDATE FUNCTIONS --

function moveRoad( dir )
   if dir == 'left' and (player.mov.acc > 0 or player.mov.acc < 0) then
        turnLeft()
   elseif dir == 'right' and (player.mov.acc > 0 or player.mov.acc < 0) then
        turnRight()
   else
        stopTurn()
   end

   add2Angle( road.c.vel*road.c.acc )
   add2Rot( road.c.vel*road.c.acc )
   updatePositions()
end


function updateRoad()
   add2Y(player.mov.vel*player.mov.acc)
   updateDistances()
   updateAngles()
end

function add2Y( n )
   for i = 1, #road.c.p do
      road.c.p[i].y = road.c.p[i].y + n
   end
end

function add2X( n )
   for i = 1, #road.c.p do
      road.c.p[i].x = road.c.p[i].x + n
   end
end

function updatePositions()
   for i = 1, #road.c.p do
       road.c.p[i].x = screen.center.x + road.c.p[i].dist * math.cos(road.c.p[i].ao + road.c.p[i].ar)
       road.c.p[i].y = screen.center.y + road.c.p[i].dist * math.sin(road.c.p[i].ao + road.c.p[i].ar)
   end
end

function updateAngles()
   for i = 1, #road.c.p do
      road.c.p[i].ar = getAngle( screen.center.x, screen.center.y, road.c.p[i].x, road.c.p[i].y ) - road.c.p[i].ao
   end
end

function updateDistances()
   for i = 1, #road.c.p do
       road.c.p[i].dist = getDistance( screen.center.x, screen.center.y, road.c.p[i].x, road.c.p[i].y )
   end
end

function turnLeft()
    if road.c.acc < 1 then road.c.acc = road.c.acc + road.c.acci end
end

function turnRight()
    if road.c.acc > -1 then road.c.acc = road.c.acc - road.c.acci end
end

function stopTurn()

    if( road.c.acc < 0.1 and road.c.acc > -0.1) then road.c.acc = 0
    elseif road.c.acc > 0 then road.c.acc = road.c.acc - road.c.accd
    elseif road.c.acc < 0 then road.c.acc = road.c.acc + road.c.accd
    end

end

function add2Angle( n )
   n = degree2Radian( n )
   for i = 1, #road.c.p do
      road.c.p[i].ar = road.c.p[i].ar + n
   end
end

function add2Rot( n )
   n = degree2Radian( n )
   for i = 1, #road.c.p do
      road.c.p[i].rr = road.c.p[i].rr + n
   end
end