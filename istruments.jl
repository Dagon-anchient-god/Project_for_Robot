using HorizonSideRobots
r=Robot(;animate=false)

function start!(r:: Robot)
    vert=dir!(r, Sud)
    hor=dir!(r, Ost)
    return(vert,hor)
end
   
function scvermarket!(r:: Robot)
    for side in (HorizonSide(i) for i=0:3)
        putmark!(r, side)
    end
end

function putmark!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        putmarker!(r)
        move!(r,side)
    end 
end

function end!(r::Robot,number:: Int, side :: HorizonSide)
    for _ in 1:number
            move!(r, side)
    end
end

function  dir!(r:: Robot, side :: HorizonSide)
    a=0
    while isborder(r, side) == false
        move!(r, side)
        a+=1
    end
    return(a)
end
    
function  to_the_end!(r::Robot)
    while isborder(r,Sud) == false
        move!(r,Sud)
    end
    
    while isborder(r,Ost) == false
        move!(r,Ost)
    end
    
end

function ends!(r::Robot, vert::Int, hor::Int)
    while vert>0 || hor>0
        if isborder(r,Nord)==false && vert>0
            move!(r,Nord)
            vert-=1
        end

        if isborder(r,West)==false && hor>0
            move!(r,West)
            hor-=1
        end
        
    end
end

function chess!(r::Robot,side ::HorizonSide,vert::Int, hor::Int)
    comand = vert+hor
    if comand % 2 ==0
        while isborder(r,side)==false
        putmarker!(r)
        move!(r,side)
        if isborder(r,side)==false
            move!(r,side)
        end
        end
    
    else 
        while isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
            if isborder(r,side)==false
                move!(r,side)
            end
        end
    end

end
