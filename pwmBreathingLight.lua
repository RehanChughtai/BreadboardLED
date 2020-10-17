pinLED = 5
dc_threshold = 300 
--threshold is the rate of change, so far 500 on need to make 300 off
pwm.setup(pinLED, 500, dc_threshold)
pwm.start(pinLED)
bottomUp = 0

function breathingLight()
    local dc = pwm.getduty(pinLED)
    if(bottomUp == 1) then
        if(dc < dc_threshold) then 
            pwm.setduty(pinLED, dc + 1)
        else 
            bottomUp = 0    
        end
    else
        if(dc > 0) then 
            pwm.setduty(pinLED, dc - 1)
        else 
            bottomUp = 1
        end
    end
end

mytimer = tmr.create(pinLED,dc_threshold)
mytimer:register(1,tmr.ALARM_AUTO,function()
    breathingLight()
end
)

mytimer:start()
