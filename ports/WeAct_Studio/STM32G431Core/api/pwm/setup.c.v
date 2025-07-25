// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2024
// License: MIT
//
// Description: PWM setup (Nucleo-L031K6 port)
module pwm

// setup function configures de PWM hardware
@[as_macro]
pub fn write(name u8, value u8) {
	C.analogWrite(name, value)
} 
	

