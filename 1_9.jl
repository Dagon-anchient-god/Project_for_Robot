using HorizonSideRobots
r=Robot(;animate=true)

function nineth(r::Robot)

    function scverse!(r::Robot)
        a=0
        b=1
        c=0

        while ismarker(r)==false
            a=beginning!(r,a)
            b=body!(r,b)
            c=return!(r,c)
        end
    end

    function beginning!(r::Robot,a::Int)
        for _ in 0:a
            moveM!(r,Nord)
        end
        for _ in 0:a
            moveM!(r,West)
        end
        a+=1
        return a
    end

    function body!(r::Robot,b::Int)
        for _ in 0:b
            moveM!(r,Sud)
        end
        for _ in 0:b
            moveM!(r,Ost)
        end
        for _ in 0:b
            moveM!(r,Nord)
        end
        b=b+2
        return b
    end

    function return!(r::Robot,a::Int)
        for _ in 0:a
            moveM!(r,West)
        end
        for _ in 0:a
            moveM!(r,Sud)
        end
        a+=1
        return a
    end 
    scverse!(r)
    function moveM!(r::Robot,side::HorizonSide)
        if ismarker(r)==false
            move!(r,side)
        end
    end

end
