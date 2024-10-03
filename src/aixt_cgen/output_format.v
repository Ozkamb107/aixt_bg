// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2023-2024
// License: MIT
module aixt_cgen

import regex

// out_format formats the output file.
fn (mut gen Gen) out_format() string{
	mut re := regex.new()
	mut temp := ''
	mut ind_count := 0

	// join all the output C blocks
	mut out := gen.out.join('\n')

	// split in single lines
	gen.out = out.split('\n')
	
	gen.insert_c_lines()	//lines pending for inserting

	// join again all the output C lines
	out = gen.out.join('\n')

	// do the replacements
	out = out.replace('___preprocessor_block___', gen.c_preproc_cmds.join('\n'))
	// out = out.replace('___includes_block___', gen.includes.join(''))
	// out = out.replace('___macros_block___', gen.macros.join(''))
	out = out.replace('___definitions_block___', gen.definitions.join('\n'))
	out = out.replace('___initialization_block___', gen.init_cmds.join('\n'))

	// delete multiple unnecessary new-line characteres
	re.compile_opt('\n\n+') or { panic(err) }
	out = re.replace(out, '\n\n')

	out = out.replace('\n\n}', '\n}')
	out = out.replace('{\n\n', '{\n')
	out = out.replace('\\\n\n', '\\\n')
	out = out.replace('#endif;', '#endif')

	// add inner-block commands indentation 
	for c in out {
		match rune(c) {
			`\n`  {
				temp += '\n' + '\t'.repeat(ind_count)
			}
			`{`  {
				ind_count++
				temp += rune(c).str()
			}
			`}`  {
				ind_count--
				temp += rune(c).str()
			}
			else {
				temp += rune(c).str()
			}
		}
	}
	temp = temp.replace('\t}', '}')
	out = temp + '\n'

	return out
}


// insert_c_lines inserts pending lines in output list
fn (mut gen Gen) insert_c_lines() {
	// println('-------- ${gen.to_insert_lines} --------')
	for i, to_insert_line in gen.to_insert_lines {
		mut insert_index := -1
		for j, line in gen.out {
			if line.contains('___TO_INSERT_${i}___') {
				insert_index = j
				break
			}
		}
		if insert_index != -1 {
			gen.out[insert_index] = gen.out[insert_index].replace('___TO_INSERT_${i}___', '')
			gen.out.insert(insert_index, to_insert_line)
		}
	}
}