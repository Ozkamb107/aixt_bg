// Project Name: Inverter
// Author: Fernando M. Santa
// Date: 05/09/2024
// Inverted echo from PORTB3 to PORTB4
// PIC16F83 fosc = 4Mhz

import time
import pin

pin.setup(pin.b3, pin.input)
pin.setup(pin.b4, pin.output)

for {
	if pin.read(pin.b3) == 1 {
		pin.low(pin.b4)
	} else {
		pin.high(pin.b4)
	}
}