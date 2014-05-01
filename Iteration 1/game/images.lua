images = {
           road = { w = 200, h = 40, types = {} }
         }


function loadImages()

         player.img = love.graphics.newImage("/game/images/player.png")

         for c = 1, 2 do
             local road = {}
             for r = 1, 3 do
                 img = love.graphics.newImage("/game/images/c/c"..c.."/r"..r..".png")
                 table.insert( road, img  )
             end
             table.insert( images.road.types, road )
         end
end

