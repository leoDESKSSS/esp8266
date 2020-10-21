wifi.setmode(wifi.STATION)
station_cfg={}
station_cfg.ssid="801"
station_cfg.pwd="13575475501"
wifi.sta.config(station_cfg)
wifi.sta.connect()
