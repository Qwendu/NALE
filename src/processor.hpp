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
	enum FAULT 
	{
		  WORD_ALIGNMENT_FAULT = 0
		, PRIVILEDGE_MODE_VIOLATION = 1
		, UNDEFINED_INSTRUCTION = 2
		, LAST
	};

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

constexpr int fault_code_base = 30000;
constexpr int fault_codes[ProcessorState::LAST] =
{
	  [ProcessorState::WORD_ALIGNMENT_FAULT] = fault_code_base + ProcessorState::WORD_ALIGNMENT_FAULT
	, [ProcessorState::PRIVILEDGE_MODE_VIOLATION] = fault_code_base + ProcessorState::PRIVILEDGE_MODE_VIOLATION
	, [ProcessorState::UNDEFINED_INSTRUCTION] = fault_code_base + ProcessorState::UNDEFINED_INSTRUCTION
};

void setFlagRegisters(ProcessorState *state, uint16_t result);

void UB();

#endif //LC_3_PROCESSOR
