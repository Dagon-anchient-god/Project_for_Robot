using HorizonSideRobots
r=Robot(;animate=true) 
function markside!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
function follow_markers!(r::Robot,side::HorizonSide)
    while ismarker(r)==true
        move!(r,side)
    end
end
markside!(r,Nord)
follow_markers!(r,Sud)
markside!(r,Sud)
follow_markers!(r,Nord)
markside!(r,West)
follow_markers!(r,Ost)
markside!(r,Ost)
follow_markers!(r,West)
putmarker!(r)