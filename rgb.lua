DIN = 2
CIN = 8

gpio.mode(DIN, gpio.OUTPUT)
gpio.mode(CIN, gpio.OUTPUT)




function clkProduce()

    gpio.write(CIN, gpio.LOW)
    tmr.delay(10)
    gpio.write(CIN, gpio.HIGH)
    tmr.delay(10)
    
end

function send32Zero()

    gpio.write(DIN, gpio.LOW)
    
    for i=1,32,1 do
        clkProduce()
    end

end