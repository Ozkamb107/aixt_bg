// Project Name: Aixt https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa - Daniel Polo - Edwin Barrera
// Date: 2022-2024
// License: MIT
//
// // Description: read functions (CY8CKIT-145-40XX)

module pin

@[inline]
pub fn read(PIN_NAME, VALUE) {
	C.PIN_NAME_Read(VALUE)
}