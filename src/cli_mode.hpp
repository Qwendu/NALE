#ifndef CLI_MODE
#define CLI_MODE
#include <stdio.h>
#include <string.h>
#include <stdint.h>

enum CLI_OPTIONS 
{
	  NONE = 0
	, PRINT_REGISTERS = 1
	, RUN_N_CYCLES = 2
	, COMPILE_AND_RUN = 3
	, PRINT_MEMORY = 4
	, CONDITIONAL  = 5
	, PC = 6
	, HELP = 7
	, VERSION = 8
	, ALWAYS = 9
	, COMMANDS = 10
	, STEP = 11
	, LAST 
	, STOP_ON_PROGRAM_COUNTER
	, PRINT_PC
	, ALWAYS_PRINT_REGISTERS
	, ALWAYS_PRINT_COMMANDS
	, ALWAYS_PRINT_PC
};


const char *cli_options_strings[CLI_OPTIONS::LAST] = 
{
	  ""
	, "regs"
	, "cycle"
	, "run"
	, "memory"
	, "if"
	, "pc"
	, "help"
	, "version"
	, "always"
	, "commands"
	, "step"
};

const char *cli_help[CLI_OPTIONS::LAST] =
{
	""
	, "Displays the register contents >> always regs =>displays the registers after every command"
	, "Run n cycles uninterrupted"
	, "Run assembly"
	, "Display the entire tracked memory"
	, "Specify a conditional"
	, "display the program counter >> always pc => displays the registers after every command"
	, "Displays help"
	, "Displays the version"
	, "always modifier, does something after every command"
	, "displays the commands >> always commands =>displays the commands after every command"
	, "steps one cycle equivalent to cycle 1"
};

char buffer[0x100];

struct InputOption
{
	CLI_OPTIONS option = CLI_OPTIONS::NONE;
	union
	{
		int n_cycles;
		const char *assembly;
		uint16_t pc;
	} data;
	
};

struct CLI {
	bool print_registers = false;
	bool run_cycles = 1;
	int cycles_until_next_cli = 0;
	bool stop_on_pc = 0;
	uint16_t pc_to_stop_on = 0;
	bool print_commands = 0;
	bool print_help = 0;
	bool always_print_commands = 0;
	bool always_print_registers = 0;
	bool always_print_pc = 0;
	bool print_pc = false;
};


InputOption
readOption(FILE *input, FILE *output)
{
	bool read_again = true;
	InputOption opt = {CLI_OPTIONS::NONE, {}};
	while(read_again)
	{
		read_again = fscanf(input, "%s",buffer) != 1;
		if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::PRINT_REGISTERS]) == 0)
		{
			if(opt.option == CLI_OPTIONS::ALWAYS)
			{
				opt.option = CLI_OPTIONS::ALWAYS_PRINT_REGISTERS;
			}else{
				opt.option = CLI_OPTIONS::PRINT_REGISTERS;
			}
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::RUN_N_CYCLES]) == 0)
		{
			opt.option = CLI_OPTIONS::RUN_N_CYCLES;
			fscanf(input, "%d", &opt.data.n_cycles);
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::COMPILE_AND_RUN]) == 0)
		{
			opt.option = CLI_OPTIONS::COMPILE_AND_RUN;
			fprintf(output,"Not implemented yet\n");
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::PRINT_MEMORY]) == 0)
		{
			opt.option = CLI_OPTIONS::PRINT_MEMORY;
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::CONDITIONAL]) == 0)
		{
			fprintf(output, "Please enter the condition\n");
			opt.option = CLI_OPTIONS::CONDITIONAL;
			fflush(stdout);
			read_again = true;
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::PC]) == 0)
		{
			if(opt.option != CLI_OPTIONS::CONDITIONAL)
			{
				if(opt.option == CLI_OPTIONS::ALWAYS)
				{
					opt.option = CLI_OPTIONS::ALWAYS_PRINT_PC;
				}else{
					opt.option = CLI_OPTIONS::PRINT_PC;
				}
			}else{
				unsigned int pc = -1;
				opt.option = CLI_OPTIONS::STOP_ON_PROGRAM_COUNTER;
				if(fscanf(input, "%04x", &pc) != 1)
				{
					read_again = true;
					opt.option = CLI_OPTIONS::NONE;
				}
				opt.data.pc = pc;
			}
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::VERSION]) == 0){
			opt.option = CLI_OPTIONS::VERSION;
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::HELP]) == 0){
			opt.option = CLI_OPTIONS::HELP;
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::ALWAYS]) == 0){
			opt.option = CLI_OPTIONS::ALWAYS;
			fprintf(output, "Always display ");
			read_again = true;
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::COMMANDS])== 0){
			if(opt.option == CLI_OPTIONS::ALWAYS)
			{
				opt.option = CLI_OPTIONS::ALWAYS_PRINT_COMMANDS;
			}else{
				opt.option = CLI_OPTIONS::COMMANDS;
			}
		}else if(strcmp(buffer, cli_options_strings[CLI_OPTIONS::STEP]) == 0){
			opt.option = CLI_OPTIONS::RUN_N_CYCLES;
			opt.data.n_cycles = 1;
		}else{
			fprintf(output, "Did not recognize any of the options\nPlease try again!\n");
			read_again = true;
		}
	}

	return opt;
}


struct Arguments
{
	const char *program = 0;
	bool display_help = 0;
};


#endif //CLI_MODE
