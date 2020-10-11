using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true)
function third!(r::Robot)
    function to_start!(r::Robot)
        while isborder(r,Sud)==false || isborder(r,Ost)==false
            vert,hor=start!(r)
        end
        return(vert,hor)
    end

    function inverse(side::HorizonSide)
        HorizonSide(mod(Int(side)+2, 4))
    end

    function toscver!(r ::Robot, side ::HorizonSide)
    while   isborder(r,Nord) == false
            while isborder(r,side) ==false && isborder(r,Nord) == false
                move!(r, side)
            end
            if isborder(r,Nord)==false
                move!(r,Nord)
            end
            while isborder(r,inverse(side)) ==false && isborder(r,Nord) == false
                move!(r,inverse(side))
            end
        end
    end

    function aroundscver!(r) 
        for side in (HorizonSide(i) for i=0:3)
            while isborder(r,side) == true
                putmarker!(r)
                move!(r,HorizonSide(mod(Int(side)+3, 4)))
             end
        putmarker!(r)
        move!(r, side)
        end
    end
    vert,hor = to_start!(r)
    toscver!(r,West)
    aroundscver!(r)
    to_the_end!(r)
    end!(r, vert, Nord)
    end!(r, hor, West)
end
third!(r)