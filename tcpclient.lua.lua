LinkStat = 0        
TCPClient = nil     
 
 
 

wifi.setmode(wifi.STATION)
station_cfg={}
station_cfg.ssid="8011"
station_cfg.pwd="13575475501"
wifi.sta.config(station_cfg)
wifi.sta.connect()



 
tmr.alarm(3,1000,1,function()
    if LinkStat == 0 then  
        TCPClient = net.createConnection(net.TCP,0)   
     
        TCPClient:connect(8080,"192.168.191.1")   
 
        TCPClient:on("receive", function(sck, data) 
              uart.write(0,data) 
        end)
        TCPClient:on("connection", function(sck, c) 
            LinkStat = 1
            print("Link OK")
            tmr.stop(3)
 
            TCPClient:on("disconnection", function(sck, c)
                LinkStat = 0
                print("link no")
                tmr.start(3)
            end)
       end)
       if  LinkStat == 0 then print("LinkError") end
    end
end)
 
 
uart.on("data",0,function (receive)       
               if  TCPClient ~= nil then
                  TCPClient:send(receive,function() end)
               end
end,0)
