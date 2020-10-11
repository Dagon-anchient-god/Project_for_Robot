using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true)
function seventh!(r::Robot)
putmarker!(r)
function to_start!(r::Robot)
    while isborder(r,Sud)==false || isborder(r,Ost)==false
        vert,hor=start!(r)
    end
    return(vert,hor)
end
vert,hor = to_start!(r)
while isborder(r,Nord)==false
    chess!(r,West,vert,hor)
    move!(r,Nord)
    chess!(r,Ost,vert,hor)
    move!(r,Nord)
end
chess!(r,West,vert,hor)
to_the_end!(r)
end!(r, vert, Nord)
end!(r, hor, West)
end
seventh!(r)