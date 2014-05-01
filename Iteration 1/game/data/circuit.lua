
circuit = {
                 -- d = distance to center, r = image rotation degree
                 -- ao = original angle respect previous piece or void
                 -- ar = real angle when drawing

                 [1] = {
                          vel = 5,   -- angular vel
                          acc = 0,   -- acceleration
                          acci = 0.009,  -- acceleration increase value
                          accd = 0.02,  -- acceleration decrease value
                          p = {                                        -- p = path
                                [1] = { dir = 'su', i = 1, num = 24},  -- MUST ALWAYS start with a straight up
                                [2] = { dir = 'tlu', i = 3, num = 1},
                                [3] = { dir = 'sl', i = 1, num = 24},
                       --       [4] = { dir = 'tld', i = 3, num = 1},
                              }

                       }
          }
          
function loadCircuit( n )
         local c = {}
         
         c.vel = circuit[n].vel
         c.acc = circuit[n].acc
         c.acci = circuit[n].acci
         c.accd = circuit[n].accd
         c.p = {}

         for i = 1, #circuit[n].p do
                caux = loadFragment( circuit[n].p[i] , circuit[n].p.r )
                for j = 1, #caux do
                   table.insert(c.p, caux[j])
                end
         end

         return c
end

function loadFragment( f , r ) -- f = fragment, r = rotation
         local cirf = {}

         for i = 1, f.num do
             local road = { x = 0, y = 0, iNum = f.i, dir = f.dir, dist = 0, ao = 0, ar = 0, ro = 0, rr = 0 }
             table.insert(cirf, road)
         end

         return cirf
end