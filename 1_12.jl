using HorizonSideRobots
include("istruments.jl")
r=Robot(;animate=true) 
function starts!(r:: Robot)
    vert=dir!(r, Sud)
    hor=dir!(r, West)
    return(vert,hor)
end
function  mchess!(r::Robot,n::Int)
    a=0
    side = Nord
    c=n
    for _ in 1:n
        putmarker!(r)
        a=PMmove!(r,side,n-a)

        if n>1 &&  isborder(r,Ost)==false
            Pmove!(r,Ost)
            c-=1           
        end
        side= inverse(side)

    end

    if n==1
        PNmove!(r,Ost,n)
    end

    if side==Sud
        PNmove!(r,Ost,n)
        PNmove!(r,Sud,n-1-a)
    else
        PNmove!(r,Ost,n)
    end
    
end

function  PMmove!(r::Robot,side::HorizonSide,n::Int)
    a=n-1
    for _ in 2:n
        a-=Pmove!(r,side)
        putmarker!(r)
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
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2, 4))
end
function  twelve!(r::Robot,n::Int)
    vert,hor=starts!(r)
    step=-1
    edge=false

    while edge==false
        if isborder(r,Ost)==true

            if step>0 && n==1
                putmarker!(r)
            end

            PNmove!(r,Nord,n)
            dir!(r,West)
            step=step*-1
            if  step>0 
                PNmove!(r,Ost,n)
            end
        end
        mchess!(r,n)
        edge=edge!(r)
    end

    while isborder(r,Sud) == false
        Pmove!(r,Sud)
    end
    
    while isborder(r,West) == false
        Pmove!(r,West)
    end

    end!(r, vert, Nord)
    end!(r, hor, Ost)
end

function  edge!(r::Robot)
    edge=false
    a=0
    while ismarker(r)==true && isborder(r,Nord)==false 
        move!(r,Nord)
        a+=1
    end
    if isborder(r,Nord)==true && isborder(r,Ost)==true
        edge=true
    end
    PNmove!(r,Sud,a)
    return(edge)
end

twelve!(r,6)