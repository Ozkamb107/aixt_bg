// Project name: Aixt project, https://github.com/fermarsan/aixt.git
// Author: Cesar Alejandro Roa Acosta and Fernando M. Santa
// Date: 2024
// License: MIT
//
// Description: Port management functions
//              (PIC16F676 port)
module port

@[inline]
pub fn write(PORT_NAME, VALUE) {
	C.PORT ## PORT_NAME = VALUE
}