#ifndef LC_3_PROCESSOR
#define LC_3_PROCESSOR
#include <stdint.h>
#include <stdlib.h>


typedef uint16_t word;
typedef uint8_t  byte;

extern char const * register_names[];

size_t constexpr memory_size = (((uint32_t)1<<16) - 1) * sizeof(uint8_t);

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

void setFlagRegisters(ProcessorState *state, uint16_t result);

void UB();

#endif //LC_3_PROCESSOR
