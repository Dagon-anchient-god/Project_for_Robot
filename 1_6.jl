using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true)
function sixth!(r::Robot)
function to_start!(r::Robot)
    while isborder(r,Sud)==false || isborder(r,Ost)==false
        vert,hor=start!(r)
    end
    return(vert,hor)
end


function scvermarkets!(r:: Robot)
    for side in (HorizonSide(i) for i=0:3)
        while isborder(r,side)==false
            move!(r,side)
        end
        putmarker!(r)
    end
end

        
vert,hor = to_start!(r)
scvermarkets!(r)
ends!(r,vert,hor)
end
sixth!(r)
