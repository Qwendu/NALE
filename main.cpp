#include "src/FeatureFlags.hpp"
#include <cstdio>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#include "src/instruction_set.hpp"
#include "src/processor.hpp"
#include "src/memory_tracker.hpp"
#include "src/cli_mode.hpp"

#define WORD(mem) (*(word *)mem)


#define VERSION_MAJOR 0
#define VERSION_MINOR 2

// 0xa is an undefined Instruction in the LC-3b ISA, 
// that means if we ever see 0xa in the op code we 
// can stop the machine
// This will get invalidated iff 0xa is a valid opcode
#define UNINITIALIZED 0xaa

#define printInstruction(instr) printf("\tOPCODE: 0x%01x\tINSTR: 0x%04x ", instr.op_code, *(uint16_t *)&instr)

void
runNonInterruptable(ProcessorState *state, MemoryTracker *tracker, FILE *display_out)
{
	void *instr_table[] =
	{
		  [INSTR_BR]    = &&INSTR_BR_GT
		, [INSTR_ADD]   = &&INSTR_ADD_GT
		, [INSTR_LDB]   = &&INSTR_LDB_GT
		, [INSTR_STB]   = &&INSTR_STB_GT
		, [INSTR_JSR]   = &&INSTR_JSR_GT
		, [INSTR_AND]   = &&INSTR_AND_GT
		, [INSTR_LDW]   = &&INSTR_LDW_GT
		, [INSTR_STW]   = &&INSTR_STW_GT
		, [INSTR_RTI]   = &&INSTR_RTI_GT
		, [INSTR_XOR]   = &&INSTR_XOR_GT
		, [INSTR_RES_1] = &&INSTR_RES_1_GT
		, [INSTR_RES_2] = &&INSTR_RES_2_GT
		, [INSTR_JMP]   = &&INSTR_JMP_GT
		, [INSTR_SHF]   = &&INSTR_SHF_GT
		, [INSTR_LEA]   = &&INSTR_LEA_GT
		, [INSTR_TRAP]  = &&INSTR_TRAP_GT
	};

#define inc\
	Instruction current_instruction = *(Instruction *)&state->memory[state->pc];\
	state->pc += sizeof(word)/sizeof(byte)

#define next\
	goto *instr_table[((Instruction *)&state->memory[state->pc])->op_code]

INSTR_BR_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_BR_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_br(state, current_instruction, tracker);
		next;
	}
INSTR_ADD_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_ADD_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_add(state, current_instruction, tracker);
		next;
	}
INSTR_LDB_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_LDB_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_ldb(state, current_instruction, tracker);
		next;
	}
INSTR_STB_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_STB_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_stb(state, current_instruction, tracker);
		next;
	}
INSTR_JSR_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_JSR_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_jsr(state, current_instruction, tracker);
		next;
	}
INSTR_AND_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_AND_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_and(state, current_instruction, tracker);
		next;
	}
INSTR_LDW_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_LDW_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_ldw(state, current_instruction, tracker);
		next;
	}
INSTR_STW_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_STW_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_stw(state, current_instruction, tracker);
		next;
	}
INSTR_RTI_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_RTI_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_rti(state, current_instruction, tracker);
		next;
	}
INSTR_XOR_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_XOR_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_xor(state, current_instruction, tracker);
		next;
	}
INSTR_RES_1_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_RES_1_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO

		inc;
		exec_instr_res_1(state, current_instruction, tracker);
		return;
	}
INSTR_RES_2_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_RES_2_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_res_2(state, current_instruction, tracker);
		return;
	}
INSTR_JMP_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_JMP_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_jmp(state, current_instruction, tracker);
		next;
	}
INSTR_SHF_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_SHF_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_shf(state, current_instruction, tracker);
		next;
	}
INSTR_LEA_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_LEA_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_lea(state, current_instruction, tracker);
		next;
	}
INSTR_TRAP_GT:
	{
#ifdef DEBUG_PRINT_GOTO
		printf("%04x INSTR_TRAP_GT\n", state->pc);
#endif //DEBUG_PRINT_GOTO
		inc;
		exec_instr_trap(state, current_instruction, tracker);
		next;
	}
	return;
}

void
runInterruptable(ProcessorState *state, MemoryTracker *tracker, FILE *display_out)
{
	CLI cli;
	while(state->memory[0xFFFF] & 0x80)
	{
		if(   (cli.cycles_until_next_cli <= 0 && cli.run_cycles)
		   || (cli.stop_on_pc && state->pc == cli.pc_to_stop_on)
		)
		{
			bool cli_exit = false;
			cli.stop_on_pc = false;
			cli.run_cycles = false;
			do{
				fflush(stdout);
				// print 
				
				printf("> ");
				fflush(stdout);
				// get input
				InputOption input = readOption(stdin, stdout);
				switch(input.option)
				{
					break; case CLI_OPTIONS::HELP:
					{
						printf("Type any of the commands that get printed\n");
						cli.print_commands = true;
						cli.print_help = true;
					}
					break; case CLI_OPTIONS::VERSION:
					{
						printf("NALE Version %d.%d\n", VERSION_MAJOR, VERSION_MINOR);
					}
					break; case CLI_OPTIONS::ALWAYS_PRINT_REGISTERS:
					{
						cli.always_print_registers = cli.always_print_registers ? false: true;
						printf("Printing registers after every command %s\n", cli.always_print_registers ? "on": "off");
					}
					break; case CLI_OPTIONS::PRINT_REGISTERS:
					{
						cli.print_registers = true;
					}
					break; case CLI_OPTIONS::RUN_N_CYCLES:
					{
						cli_exit = true;
						cli.run_cycles = true;
						cli.cycles_until_next_cli = input.data.n_cycles - 1;
						printf("Executing %d Cycle%c\n", cli.cycles_until_next_cli + 1, cli.cycles_until_next_cli == 0 ? ' ' : 's');
					}
					break; case CLI_OPTIONS::PRINT_MEMORY:
					{
						printTouchedMemory(tracker, state->memory);
					}
					break; case CLI_OPTIONS::STOP_ON_PROGRAM_COUNTER:
					{
						cli_exit = true;
						cli.stop_on_pc = true;
						cli.pc_to_stop_on = input.data.pc;
					}
					break; case CLI_OPTIONS::PRINT_PC:
					{
						cli.print_pc = true;
					}
					break; case CLI_OPTIONS::ALWAYS_PRINT_PC:
					{
						cli.always_print_pc = cli.always_print_pc ? false : true;
						printf("Printing pc after every command is %s\n", cli.always_print_pc ? "on": "off");
					}
					break; case CLI_OPTIONS::COMMANDS:
					{
						cli.print_commands = true;
					}
					break; case CLI_OPTIONS::ALWAYS_PRINT_COMMANDS:
					{
						cli.always_print_commands = cli.always_print_commands ? false : true;
						printf("Printing commands after every command is %s\n", cli.always_print_commands ? "on": "off");
					}
					break; default:
					{
						printf("It seems that the option is not yet implemented\nTrying again\n");
					}
				}
				if(cli.always_print_registers || cli.print_registers){
					cli.print_registers = false;
					printf("Registers:\n");
					printf(
						"\n\t\tR0: 0x%04x \tR1: 0x%04x \tR2: 0x%04x \tR3: 0x%04x \t"
						"\n\t\tR4: 0x%04x \tR5: 0x%04x \tR6: 0x%04x \tR7: 0x%04x \t"
						"\n\t\tN:  %c      \tZ:  %c      \tP:  %c\t\n"
						,  state->registers[0b000]
						,  state->registers[0b001]
						,  state->registers[0b010]
						,  state->registers[0b011]
						,  state->registers[0b100]
						,  state->registers[0b101]
						,  state->registers[0b110]
						,  state->registers[0b111]
						,  '0' + state->status_register.negative
						,  '0' + state->status_register.zero
						,  '0' + state->status_register.positive
						);
				}
				if(cli.always_print_commands || cli.print_commands)
				{
					cli.print_commands = false;
					printf("\nCommands:\n");
					int offset = 15;
					for(int i = CLI_OPTIONS::NONE + 1; i < CLI_OPTIONS::LAST; i++)
					{
						int o = 4 + strlen(cli_options_strings[i]);
						printf("%02d: %s ", i, cli_options_strings[i]);
						if(cli.print_help)
						{
							for(int i = 0; i < offset - o; i++)
							{
								printf(" ");
							}
							printf("%s", cli_help[i]);
						}
						printf("\n");
					}
					if(cli.print_help) cli.print_help = false;
				}
				if(cli.print_pc || cli.always_print_pc)
				{
					cli.print_pc = false;
					printf("PC: 0x%04x\n", state->pc);
				}
			}while(!cli_exit);

			//execute
		}else{
			cli.cycles_until_next_cli -= 1;
		}
		
		Instruction current_instruction = *(Instruction *)&state->memory[state->pc];
		warnUntouchedMemory(tracker, state->pc);
		markAddressTouched(tracker, state->pc);
		printf("0x%04x: ", state->pc);
		state->pc += sizeof(word);
		printInstruction(current_instruction);
		switch(current_instruction.op_code)
		{
			break;case INSTR_BR: 
			{
				exec_instr_br(state, current_instruction, tracker);
			}
			break; case INSTR_ADD:
			{
				exec_instr_add(state, current_instruction, tracker);
			}
			break; case INSTR_LDB:
			{
				exec_instr_ldb(state, current_instruction, tracker);
			}
			break; case INSTR_STB:
			{
				exec_instr_stb(state, current_instruction, tracker);
			}
			break; case INSTR_JSR:
			{
				exec_instr_jsr(state, current_instruction, tracker);
			}
			break; case INSTR_AND: 
			{
				exec_instr_and(state, current_instruction, tracker);
			}	
			break; case INSTR_LDW:
			{
				exec_instr_ldw(state, current_instruction, tracker);
			}
			break; case INSTR_STW:
			{
				exec_instr_stw(state, current_instruction, tracker);
			}
			break; case INSTR_RTI:
			{
				exec_instr_rti(state, current_instruction, tracker);
			}
			break; case INSTR_XOR:
			{
				exec_instr_xor(state, current_instruction, tracker);
			}
			break; case INSTR_RES_1:
			{
				exec_instr_res_1(state, current_instruction, tracker);
			}
			break; case INSTR_RES_2:
			{
				exec_instr_res_2(state, current_instruction, tracker);
			}
			break; case INSTR_JMP:
			{
				exec_instr_jmp(state, current_instruction, tracker);
			}
			break; case INSTR_SHF:
			{
				exec_instr_shf(state, current_instruction, tracker);
			}
			break; case INSTR_LEA:
			{

				exec_instr_lea(state, current_instruction, tracker);
			}
			break; case INSTR_TRAP:
			{
				exec_instr_trap(state, current_instruction, tracker);
			}
		}

    }
}

int main(int argc, const char **argv)
{
	
	if(argc < 2)
	{
		printf("LC-3 args: <program> [-I]\nExiting\n");
		exit(403);
	}
	ProcessorState state;
	
	size_t program_size = 0;
	// Opening binary
	{
		FILE *executable = fopen(argv[1], "rb");
		if(executable == 0)
		{
			fprintf(stderr, "Could not find %s\n Exiting.\n", argv[1]);
			exit(404);
		}
		fseek(executable, 0, SEEK_END);
		size_t executable_length = ftell(executable);
		if(executable_length >= 0xFFFF) executable_length = 0xFFFF;
		fseek(executable, 0, SEEK_SET);
		state.memory = (byte *)malloc(memory_size);
		assert(state.memory);
		memset(state.memory,UNINITIALIZED, memory_size);
		memset(&state.memory[DISPLAY_DATA_REGISTER], 0,2);
		memset(&state.memory[DISPLAY_SIGNAL_REGISTER], 0,2);
		memset(&state.memory[0xFFFE], 0, 1);
		fread(state.memory,1,executable_length, executable);
		program_size = executable_length;
	}
	FILE *display_out = 0;
	display_out = fopen("display.txt", "w");

	bool cli_mode = false;
	{
		if(argc >= 3)
		{
			cli_mode = strcmp("-I", argv[2]) == 0;
		}
	}
	state.pc = 0x0400;
	state.memory[0xFFFF] |= 0x80;
	MemoryTracker *tracker = createMemoryTracker();
	markRangeTouched(tracker,0x0000, program_size);
	printf("NALE\n");
	if(cli_mode)
	{
		runInterruptable(&state, tracker, display_out);
	}else
	{
		runNonInterruptable(&state, tracker, display_out);
	}
	printTouchedMemory(tracker,state.memory);
	fflush(stdout);
	fflush(display_out);
	fclose(display_out);
	return 0;
}
