import pin
import uart
import time {sleep_ms}

//CONFIG DE LOS PINES
pin.setup(pin.c6, pin.output)       //RC6 = TX

//Inicializamos la comunicación serial
uart.setup()

for {
    uart.write(0x33)
    sleep_ms(500)
	uart.write(0x99)
    sleep_ms(500)
}