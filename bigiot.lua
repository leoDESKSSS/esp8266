
srv = net.createConnection(net.TCP, 0)
tmp = 2
srv:on("receive", function(sck,data) 
    
    print(data)
    json=cjson.decode(data)
    print(json.M)
    print(json.C)

    if(json.M=="say")then
        tmp=json.C

    end
    
    
    if(json.M=="say")then
        --tmr.stop(0)
        print("send"..tmp)
        --srv:send( [[{"M":"update","ID":"15378","V":{"14016":"]]..json.C..[["}}]]..'\n') 
    end
end)

srv:on("connection", function()
    print("connect ok!")
    srv:send("{\"M\":\"checkin\",\"ID\":\"15378\",\"K\":\"d462a28af\"}\n")
end)

srv:connect(8181,"www.bigiot.net")


tmr.alarm(0,6000,1,function()
    
    --srv:send( [[{"M":"update","ID":"15378","V":{"14016":"]]..tmp..[["}}]]..'\n') 
    if(tmp~=nil)then
        srv:send( [[{"M":"update","ID":"15378","V":{"14016":"]]..tmp..[["}}]]..'\n')
        print("send ok json"..tmp)
    else
        print("not yet")
    end
end)