// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2023-2024
// License: MIT
module uart2

pub fn print(msg string) {
	C.printf('\033[1;34m')	// blue
    C.printf('%s', msg)
}