# Aixt TODO

Tasks to do in Aixt


### Todo

- [ ] Implement variable swapping (by using temporal vars) #feat
- [ ] dynamic memory definition
- [ ] generates documentation from code
- [ ] Implement inline assembly
- [ ] "40_inline_asm.v" inline asm implementation
- [ ] Implement uart.input()
- [ ] Support for arrays and strings initialized inside "for" statement
- [ ] change "set" by "setup" in sensor module (NXT port)
- [ ] Issue: Ident names including module and function name or scope position (for all ports)


### In Progress

- [ ] Implement structs #feat
    - [ ] support struct fields (`struct_name.struct_field`)
- [ ] implement maps
- [ ] Change arrays to pure V
- [ ] Standardize (with original V) the identifier names in the generated C code
- [ ] make groups of PIC microcontrollers families
- [ ] Start a vscode extension for Aixt
- [ ] Give support to reference and dereference

### Done ✓

- [x] add a custom attribute for defining constants and functions as C macros in order to save memory in small devices
- [x] define API modules' parameters as constants
- [x] Divide the parsing files order in two rounds (the second one including the imported module's files)
- [x] Allow implementation of the same Module on multiple directories