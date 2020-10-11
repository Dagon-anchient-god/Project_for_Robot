using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true)
function second!(r::Robot)
    vert,hor=start!(r)
    scvermarket!(r)
    end!(r, vert, Nord)
    end!(r, hor, West)
end
