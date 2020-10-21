node.setcpufreq(node.CPU160MHZ)
wifi.setmode(wifi.STATION)
wifi.sta.autoconnect(1)
station_cfg={}
station_cfg.ssid="OpenWrt"
station_cfg.pwd="1234567887"
wifi.sta.config(station_cfg)
wifi.sta.connect()

wifi.sta.disconnect()

tmr.delay(8000000)

print( wifi.sta.getip() )

flag = 0

TCPClient = net.createConnection(net.TCP,0)
TCPClient:on("connection", function(sck, c)
  print("Link Ok")
  flag = 1
  
end)
TCPClient:on("receive", function(sck, c) print(c) end)
TCPClient:connect(9000,"bed.xuebaeasy.com") 



tmr.delay(1000000)

TCPClient:connect(9000,"192.168.1.244")  

tmr.delay(1000000)

uart.on("data",0,function (receive)       
               if  TCPClient ~= nil then
                  
                  TCPClient:send(receive)
               end
end,0) 









