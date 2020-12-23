using HorizonSideRobots
r=Robot(;animate=true) 

function findmark!(r::Robot,side::HorizonSide)
    temp=0
    numb=0
    while isborder(r,Nord)==false
        dirs!(r,side)
        if ismarker(r)==true 
            temp+=temperature(r)
            numb+=1
            if isborder(r,side)==false
                move!(r,side)
            end
        end
        if isborder(r,side)==true
            if isborder(r,Nord)==false
                move!(r,Nord)
                side =inverse(side)
            end
        end
    end
    while isborder(r,side)==false
        dirs!(r,side)
        if ismarker(r)==true 
            temp+=temperature(r)
            numb+=1
        end
            if isborder(r,side)==false
                move!(r,side)
            end
    end
    a = temp/numb
    return(a)
end
function dirs!(r::Robot,side::HorizonSide)
    if isborder(r,side)==false
        moveM!(r,side)
    end
end
function moveM!(r::Robot,side::HorizonSide)
        if ismarker(r)==false
            move!(r,side)
        end
end
function inverse(side::HorizonSide)
        HorizonSide(mod(Int(side)+2, 4))
end
findmark!(r,Ost)