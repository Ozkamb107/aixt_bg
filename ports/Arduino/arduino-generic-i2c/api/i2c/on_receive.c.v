// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Juan Pablo Bernal - Daniela Mendoza Deantonio - Fernando Martinez Santa 
// Date: 2024

module i2c

//print function prints data to the serial port as human-readable ASCII text
@[as_macro]
pub fn on_receive(function_pointer fn(int)) {  
	C.WIRE_ONRECEIVE(function_pointer)
}