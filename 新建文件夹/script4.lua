


wifi.setmode(wifi.STATION)
station_cfg={}
station_cfg.ssid="OpenWrt"
station_cfg.pwd="1234567887"
wifi.sta.config(station_cfg)
wifi.sta.connect()





TCPClient = net.createConnection(net.TCP,0)
TCPClient:connect(9000,"192.168.1.244")   

TCPClient:send("123",function() end)
tmr.alarm(1, 3000, 0, function()




uart.on("data",0,function (receive)       
               if  TCPClient ~= nil then
                  TCPClient:send(receive,function() end)
               end
end,0) 


end)



srv:on("connection", function(sck, c)
  sck:send("GET /get HTTP/1.1\r\nHost: httpbin.org\r\nConnection: close\r\nAccept: */*\r\n\r\n")
end)