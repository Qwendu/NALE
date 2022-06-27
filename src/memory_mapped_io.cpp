#include "memory_mapped_io.hpp"

static FILE *display_out = nullptr;


void openDisplay(char const * const path)
{
	closeDisplay();
	display_out = fopen(path, "w");
}


void closeDisplay()
{
	if(display_out) fclose(display_out);
}

void display(ProcessorState *pstate)
{
	if(!display_out) return;
	if(*(word *)&pstate->memory[DISPLAY_DATA_REGISTER] != 0)
	{
		fprintf(display_out, "%c", (char)pstate->memory[DISPLAY_DATA_REGISTER]);
		*(word *)&pstate->memory[DISPLAY_DATA_REGISTER] = 0x00;
		fflush(display_out);
	}
}
