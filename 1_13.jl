using HorizonSideRobots
r=Robot(;animate=true)
function put_markers!(r::Robot,side1::HorizonSide,side2::HorizonSide)
    while isborder(r,side1)==false && isborder(r,side2)==false
        Pmove!(r,side1)
        Pmove!(r,side2)
        putmarker!(r)   
    end
end
function follow_markers!(r::Robot,side1::HorizonSide,side2::HorizonSide)
    while ismarker(r)==true
        Pmove!(r,side1)
        Pmove!(r,side2)
    end
end
function  Pmove!(r::Robot,side::HorizonSide,)
        if isborder(r,side)==false
            move!(r,side)
        end
end
put_markers!(r,Nord,West)
follow_markers!(r,Sud,Ost)
put_markers!(r,Nord,Ost)
follow_markers!(r,Sud,West)
put_markers!(r,Sud,West)
follow_markers!(r,Nord,Ost)
put_markers!(r,Sud,Ost)
follow_markers!(r,Nord,West)
putmarker!(r) 
