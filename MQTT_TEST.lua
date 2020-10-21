
m = mqtt.Client("leo", 120)

m:connect("47.115.155.155", 1883, function(client)
    print("connecting...")

    
end)

m:on("connect", function(con) print ("connected") 
    m:subscribe("home/bedroom/switch1/set",0, function(conn) 
        print("subscribe success") 

        pin=1
        gpio.mode(pin, gpio.OUTPUT)
        gpio.write(pin, gpio.LOW)

       
    end)
    
    
end)
m:on("offline", function(con) print ("offline") end)


m:on("message", function(conn, topic, data) 
    print(topic .. ":" )
    
    if data ~= nil then
        print(data)

        if data == "ON"then gpio.write(pin, gpio.HIGH) end
        if data == "OFF"then gpio.write(pin, gpio.LOW) end
        
        m:publish("home/bedroom/switch1",data,0,0, function(conn) print("sent"..data) end)


        
    end

    
end)


