dofile("wifi_config.lua")


pin=1
gpio.mode(pin, gpio.OUTPUT)
gpio.write(pin, gpio.LOW)

mytimer = tmr.create()
mytimer:register(10000, tmr.ALARM_SINGLE, function() dofile("MQTT_TEST.lua") end)
mytimer:start()
