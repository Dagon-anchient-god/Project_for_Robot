using HorizonSideRobots
r=Robot(;animate=true) 
function eight!(r::Robot)
    function  inverse(side::HorizonSide)
        HorizonSide(mod(Int(side)+2,4))
    end
    function to_door!(r::Robot)
        a=1
        side = West
        while isborder(r,Nord)==true
            for _ in 0:a
                move!(r,side)
            end
            a+=1
            side=inverse(side)
        end
    end
    to_door!(r)
end
eight!(r)