// Project name: Aixt project, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2023-2024
// License: MIT
module build

import os
import v.ast
import v.token
import v.pref
import aixt.setup
import aixt.cgen

// transpile_file transpiles an Aixt source code into C.
pub fn transpile_file(path string, project_setup setup.Setup, aixt_path string) {
	mut c_gen := cgen.Gen{
		files:              []&ast.File{}
		table:              ast.new_table()
		cur_scope: 			&ast.Scope{}
		cur_left:			ast.Nil{}
		cur_left_type:		0
		cur_op:				token.Kind.unknown
		cur_cond:			ast.Nil{}
		transpiler_path:	aixt_path
		// imports: 		 	[]string{}
		source_paths: 		[]string{}
		out: 				[]string{}
		c_preproc_cmds:		[]string{}
		api_mod_paths:		map[string][]string{}
		lib_mod_paths:		map[string][]string{}
		include_paths:	    []string{}
		// macros: 			 []string{}
		definitions: 		[]string{}
		init_cmds:			[]string{}
		to_insert_lines:	[]string{}
		cur_fn: 			'main'
		file_count: 		0
		level_count:        0
		match_as_nested_if: false
		cpu_freq_defined:	false
		pref:	 			&pref.Preferences{}
		setup:			    project_setup
	}

	// set de defines from the port's json file
	mut defines := ['']
	for define in c_gen.setup.v_defines {
		defines << ['-d', define]
	}
	// println('-------------------- ${defines} --------------------------')
	c_gen.pref, _ = pref.parse_args_and_show_errors([], defines, true)
	c_gen.pref.is_script = true
	c_gen.pref.enable_globals = true
	// c_gen.pref.experimental = true	//XXXXXXXXXXXXXXXXX DISABLE for V compiler v0.4.9+ (avoid manual C functions declaration) XXXXXXXXXXXXXXXXX 
	
	// println('##################### ${c_gen.pref.compile_values} ########################')


	// println('\n\n+++++++${path}++++++++\n\n')
	mut transpiled := c_gen.gen(path) // transpile Aixt (V) to C

	if transpiled != '' {
		output_ext := match c_gen.setup.backend {
			'nxc' 		{ '.nxc' }
			'arduino'	{ '.ino' }
			else 		{ '.c' }
		}

		mut output_path := ''
		if os.is_file(path) {
			output_path = path.replace('.v', output_ext)
		} else {
			output_path = '${path}/main${output_ext}'
		}
		os.write_file(output_path, transpiled) or {}
	}
	// println('##################### ${c_gen.pref.compile_values} ########################')

}
