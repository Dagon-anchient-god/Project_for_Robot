using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true)
function fifth!(r::Robot)
vert,hor=start!(r)

function stages!(r::Robot,number:: Int, side :: HorizonSide)
    for _ in 1:number
            putmarker!(r)
            move!(r, side)
            putmarker!(r)
    end
    return(number-1)
end
function piramid!(r)
    b=0
    b =dir!(r,West)
    while isborder(r,Nord)==false
        b=stages!(r, b, Ost)
        dir!(r,West)
        move!(r, Nord)
    end
    stages!(r, b, Ost)
end
piramid!(r)
to_the_end!(r)
end!(r, vert, Nord)
end!(r, hor, West)
end
fifth!(r)