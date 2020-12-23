using HorizonSideRobots
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
x=to_the_wall!(r,Nord,West)
y=to_the_wall!(r,Sud,Ost)
while isborder(r,Ost)==false
    move!(r,Ost)
end
c=y[1]-x[1]
for _ in 1:c
    move!(r,Nord)
end
putmarker!(r)
to_the_wall!(r,West,Nord)
base!(r,x[2],Ost)

