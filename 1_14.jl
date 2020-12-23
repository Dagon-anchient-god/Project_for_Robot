using HorizonSideRobots
r=Robot(;animate=true) 
function obsticalls!(r::Robot,side::HorizonSide)
    a=0
    if isborder(r,side)==false
        move!(r,side)
        a+=1
    end
    return(a)
end

function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2, 4))
end

function arround!(r::Robot,side1::HorizonSide,side2::HorizonSide)
    b=0
    while isborder(r,side1)==true && isborder(r,side2)==false
        b+=obsticalls!(r,side2)
    end
    return(b)
end

function  Pmove!(r::Robot,side::HorizonSide,)
    if isborder(r,side)==false
        move!(r,side)
    end
end

function  PMmove!(r::Robot,side::HorizonSide,n::Int)
    for _ in 1:n
        Pmove!(r,side)
    end
end

function through!(r::Robot,side1::HorizonSide,side2::HorizonSide)
    b=0
    while isborder(r,side1)==true
        b=arround!(r,side1,side2)
        Pmove!(r,side1)
        while isborder(r,inverse(side2))==true
            Pmove!(r,side1)
        end
        if isborder(r,side1)==true && isborder(r,side2)==true
            break
        end
        PMmove!(r,inverse(side2),b)
        putmarker!(r)
    end
    if isborder(r,side1)==true && isborder(r,side2)==true
        PMmove!(r,inverse(side2),b)
    end
end

function put_S_markers!(r::Robot,side1::HorizonSide,side2::HorizonSide)
    while isborder(r,side1)==false 
        Pmove!(r,side1)
        putmarker!(r)
        through!(r,side1,side2)
    end    
end

function follow_S_markers!(r::Robot,side1::HorizonSide,side2::HorizonSide)
    b=0
    while ismarker(r)==true
        Pmove!(r,side1)
        if isborder(r,side1)==true
            b=arround!(r,side1,side2)
            Pmove!(r,side1)
            while isborder(r,inverse(side2))==true
                Pmove!(r,side1)
            end
            PMmove!(r,inverse(side2),b)
        end
    end
end

put_S_markers!(r,Nord,West)
follow_S_markers!(r,Sud,Ost)
put_S_markers!(r,Sud,West)
follow_S_markers!(r,Nord,Ost)
put_S_markers!(r,West,Nord)
follow_S_markers!(r,Ost,Sud)
put_S_markers!(r,Ost,Nord)
follow_S_markers!(r,West,Sud)
putmarker!(r) 



