screen = { height = 0, width = 0,
           center = { x = 0, y = 0 }
         }

axis = {
         v = { x1 = 0, y1 = 0, x2 = 0, y2 = 0 },
         h = { x1 = 0, y1 = 0, x2 = 0, y2 = 0 }
       }


-- LOAD FUNCTIONS --

function loadScreen()
     screen.height = love.window.getHeight()
     screen.width = love.window.getWidth()

     screen.center.x = screen.width/2
     screen.center.y = 2*screen.height/3

     axis.v.x1 = screen.center.x
     axis.v.x2 = axis.v.x1
     axis.v.y2 = screen.height

     axis.h.y1 = screen.center.y
     axis.h.x2 = screen.width
     axis.h.y2 = screen.center.y
end


-- DRAW FUNCTIONS --

function drawAxis()
    love.graphics.setColor( 50 , 50 , 50 , 200 )
    love.graphics.line(axis.v.x1, axis.v.y1, axis.v.x2, axis.v.y2)
    love.graphics.line(axis.h.x1, axis.h.y1, axis.h.x2, axis.h.y2)
    love.graphics.setColor( 255 , 255 , 255 , 255 )
end