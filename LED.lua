srv = net.createConnection(net.TCP, 0)
srv:on("receive", function(sck,data)

    json=cjson.decode(data)

    print(json.C)
    print(data)

    if(json.C=="up")then
        gpio.mode(3, gpio.OUTPUT)
        gpio.write(3, gpio.LOW)

        gpio.mode(4, gpio.OUTPUT)
        gpio.write(4, gpio.HIGH)
    end
    
    if(json.C=="down")then
            gpio.mode(3, gpio.INPUT)


            gpio.mode(4, gpio.INPUT)
     end

end)

srv:on("connection", function()
    print("connect ok!")
    srv:send("{\"M\":\"checkin\",\"ID\":\"15378\",\"K\":\"d462a28af\"}\n")
end)

srv:connect(8181,"www.bigiot.net")

tmr.alarm(0,20000,1,function()
    tmp=99
    --srv:send( [[{"M":"update","ID":"15378","V":{"14016":"]]..tmp..[["}}]]..'\n')
    srv:send("{\"M\":\"say\",\"ID\":\"xx1\",\"C\":\"xx2\",\"SIGN\":\"xx3\"}\n")
    print("ping")

end)




