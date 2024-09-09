// Project Name: Aixt project, https://github.com/fermarsan/aixt.git
// Author: Fernando Martínez Santa
// Date: 2024
// License: MIT
//
// Description: Pin-port functions (ATmega328p)
module port

// read function reads an 8 bit value from a port
@[inline]
pub fn read(name u8) u8 {
	unsafe {
		return u8(*(&C.PINB + (name*3)))
	}	
}