#include "processor.hpp"
#include <stdio.h>

const char *register_names[] = 
{
	  "R0"
	, "R1"
	, "R2"
	, "R3"
	, "R4"
	, "R5"
	, "R6"
	, "R7"
};


void setFlagRegisters(ProcessorState *state, uint16_t result)
{
	if(result & 0x8000)
	{
		state->status_register.negative = 1;
		state->status_register.zero     = 0;
		state->status_register.positive = 0;
	}else if(result == 0)
	{
		state->status_register.negative = 0;
		state->status_register.zero     = 1;
		state->status_register.positive = 0;
	}else if(~result & 0x8000)
	{
		state->status_register.negative = 0;
		state->status_register.zero     = 0;
		state->status_register.positive = 1;
	}
}

void UB()
{
	printf("\nInstruction is not implemented or not defined in the ISA\nExiting\n");
	exit(404);
}
