- [ ] Write Test Cases for instructions
- [ ] Write Resulting Memory State to a File
- [X] TRAPs
- [ ] Interrupts
- [X] IO
- [ ] Add interactive mode to executor
	- [X] Step single instruction
	- [X] Step multiple instructions
	- [X] Print memory
	- [X] Inspect registers
	- [ ] Run assembly from cli
- [X] CLI: add `--help`, `--version`
- [X] Cleanup cli mode
- [ ] Write Step function
- [ ] Write disassembler 

## Written in Rust ofcourse
- [ ] maybe interactive mode with a tui/gui app:
    - potentially [written in rust](https://github.com/fdehau/tui-rs) (bc idk how to do that in C++ lol)
    - else c++ + ncurses.h
    - separate thread, main emulator can call functions to push render updates
    - always display regs
    - set regs
    - disassembly of current execution region (PC ± 0x8)
    - display buffer
    - memory dump
    - assembly command prompt

