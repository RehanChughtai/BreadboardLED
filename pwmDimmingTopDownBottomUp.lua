dc=1023
top_down=1
pinDim = 2
pwm.setup(pinDim,1000,1023)
pwm.start(pinDim)
mytimer = tmr.create()
mytimer:alarm(100,tmr.ALARM_AUTO,function()
    if top_down==1 then
        dc=dc-10
        print(dc)
        pwm.setduty(pinDim,dc)
        if (dc<10) then
            dc=3
            top_down=0
        end
    else
        dc=dc+10
        print(dc)
        pwm.setduty(pinDim,dc)
        if (dc>1013) then
            dc=1023
            top_down=1
        end
    end
end
)
