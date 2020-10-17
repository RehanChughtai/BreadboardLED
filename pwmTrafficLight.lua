pinR = 1
pinG = 3
pinY = 2
dc = 512
pwm.setup(pinR,1000,dc)
pwm.setup(pinG,1000,dc)
pwm.setup(pinY,1000,dc)
pwm.start(pinR)
pwm.start(pinG)
pwm.start(pinY)

function trafficLight(dc_r,dc_g,dc_y)
    pwm.setduty(pinR,dc_r)
    pwm.setduty(pinG,dc_g)
    pwm.setduty(pinY,dc_y)
end

greenON=0
--3000ms for Red, 5000ms for Green, 500ms for Yellow
--can you think of an extension? for example, the controller.
--when and how you interrupt this? pedestrian button?
--still a candy awaits - Dalin
mytimer = tmr.create()
mytimer:register(3000, 1, function()
    print("Yellow Light! Careful!")
    trafficLight(0,0,512)
    tmr.delay(500000) 
    --thiS is microsecond
if greenON==0 then 
    greenON=1
    print("Green Light!")
    trafficLight(0,512,0)
    mytimer:interval(5000)
else 
    greenON=0
    print("Red Light!")
    trafficLight(512,0,0)
end 
end)
--now we don'st have high low here by using pwm
mytimer:start()

