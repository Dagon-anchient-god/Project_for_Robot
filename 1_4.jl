using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true)
function forth!(r::Robot)
vert,hor=start!(r)
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2, 4))
end
function allround!(r :: Robot, side :: HorizonSide)
    while ismarker(r)==false

        while isborder(r, side)==false
            putmarker!(r)
            move!(r,side)
            putmarker!(r)
        end

        if isborder(r,Nord)==false
            move!(r,Nord)
        end

        while isborder(r,inverse(side))==false
            putmarker!(r)
            move!(r,inverse(side))
            putmarker!(r)
        end

        if isborder(r,Nord)==false
            move!(r,Nord)
        end

    end
    
end
allround!(r, West)
to_the_end!(r)
end!(r, vert, Nord)
end!(r, hor, West)
end
forth!(r)