using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true) 
function to_the_wall!(r::Robot,side1::HorizonSide,side2::HorizonSide)
    a=0
    b=0

    while  isborder(r,(side1))==false || isborder(r,(side2))==false
        b+=arround!(r,side1,side2)
        a+=obsticalls!(r,side1)
    end
    c=b

    while c>0
        move!(r,inverse(side2))
        c-=1
    end
    x=[a,b]
    putmarker!(r)
    return(x)
end

function obsticalls!(r::Robot,side::HorizonSide)
    a=0
    while isborder(r,side)==false
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
function  base!(r::Robot,x::Int,side::HorizonSide)
    b=0
    while x>0
        if isborder(r,side)==false
            move!(r,side)
            x-=1
        else 
            while isborder(r,side)==true
                move!(r,Nord)
                b+=1
            end
            move!(r,side)
            x-=1
            while b>0
                if isborder(r,Sud)==false
                move!(r,Sud)
                b-=1
                else
                    move!(r,side)
                    x-=1
                end
            end
        end
    end
end

function  Pmove!(r::Robot,side::HorizonSide,)
    a=0
        if isborder(r,side)==false
            move!(r,side)
            a+=1
        end
    return(a)
end

function  Pmove!(r::Robot,side::HorizonSide,)
    a=0
        if isborder(r,side)==false
            move!(r,side)
            a+=1
        end
    return(a)
end

function  PNmove!(r::Robot,side::HorizonSide,n::Int)
    for _ in 1:n
        if isborder(r,side)==false
            move!(r,side)
        end
    end
end

function mark_move!(r::Robot,side::HorizonSide)
    c=1
    putmarker!(r)
    c=Pmove!(r,side)
    putmarker!(r)
    return(c)
end


function wall!(r::Robot,side::HorizonSide,n::Int)
    b=0
    c=0
    e=0
    if  isborder(r,side)==true
        while isborder(r,side)==true && isborder(r,West)==false
            Pmove!(r,West)
            b+=1
        end
        if isborder(r,side)==false
            Pmove!(r,side)
            c+=1
        end
            while isborder(r,Ost)==true && n>=c
                Pmove!(r,side)
                c+=1
                e+=1
            end
        if n>=c
            PNmove!(r,Ost,b)
            putmarker!(r)
            e=0
        else
            PNmove!(r,inverse(side),c)
            PNmove!(r,Ost,b)
        end
    end
    return(c-e)
end

function stairs!(r::Robot)
    a=0
    c=0
    putmarker!(r)
    while isborder(r,West)==false || isborder(r,Sud)==false
        
        for _ in 1:a
            c+=mark_move!(r,Nord)
            c+=wall!(r,Nord,a-c)
            if c==a
                break
            end
        end

        to_the_wall!(r,Sud,West)
        a+=1
        c=0
        Pmove!(r,West)
    end
    while isborder(r,Nord)==false
        putmarker!(r)
        Pmove!(r,Nord)
        putmarker!(r)
    end
end

vert,hor=start!(r)
stairs!(r)
