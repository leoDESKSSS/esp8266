


tmr.delay(1000000)

TCPClient = net.createConnection(net.TCP,0)
TCPClient:connect(9000,"192.168.1.244")   





uart.on("data",0,function (receive)       
               if  TCPClient ~= nil then
                  TCPClient:send(receive,function() end)
               end
end,0) 


