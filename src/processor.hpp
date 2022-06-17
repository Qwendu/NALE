#ifndef LC_3_PROCESSOR
#define LC_3_PROCESSOR



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


const size_t memory_size = (((uint32_t)1<<16) - 1) * sizeof(uint8_t);

struct ProcessorState
{
	word registers[8] = {};
	word pc = 0;
	struct
	{
		uint16_t negative : 1;
		uint16_t zero     : 1;
		uint16_t positive : 1;
		uint16_t unused   : 11;
		uint16_t priviledge_level : 1;
		
	} status_register = {.negative = 0, .zero = 0, .positive = 0, .unused = 0, .priviledge_level = 0};
	word ssp = 0;
	word usp = 0;
	byte *memory = 0;
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



#endif //LC_3_PROCESSOR
