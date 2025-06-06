// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Authors:
//        - Juan Pablo Bernal
//        - Daniela Mendoza Deantonio
//        - Fernando M. Santa
// Date: 2024

module i2c

// print function prints data to the serial port as human-readable ASCII text
@[as_macro]
pub fn request_from(address u8, quantity int) {  
    C.WIRE_REQUESTFROM(address, quantity) 
}