// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando Martínez Santa
// Date: 2024
// License: MIT
module aixt_cgen

// err_war_check checks the Aixt transpiler errors and warnings (based on v.ast.file.errors).
// This defines a list of error exceptions (allowed in Aixt but not in V)
fn (mut gen Gen) err_war_check()  {
	msg_exceptions := [ // V error message exceptions in Aixt
		'is immutable, declare it with `mut`',
		'expected `#define`',
		'unknown function:',
	]

	for i in 0 .. gen.file.errors.len {	// look for each exception message by index 
		message := gen.file.errors[i].message
		for msg in msg_exceptions {
			if message.contains(msg) {
				gen.file.errors.delete(i)
				gen.err_war_check()	// recursively deleting
				break
			}
		}
	}
}