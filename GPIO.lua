pin=0
gpio.mode(pin, gpio.OUTPUT)
gpio.write(pin, gpio.LOW)
print(gpio.read(5))
