--wifi.setmode(wifi.STATION)
station_cfg={}
station_cfg.ssid="OpenWrt"
station_cfg.pwd="1234567887"
wifi.sta.config(station_cfg)
wifi.sta.connect()

tmr.delay(8000000)

--print('IP is ' .. wifi.sta.getip())