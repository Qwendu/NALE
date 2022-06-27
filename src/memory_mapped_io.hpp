#ifndef MEMORY_MAPPED_IO
#define MEMORY_MAPPED_IO
#include <stdio.h>

#define DISPLAY_SIGNAL_REGISTER 0xFE04
#define DISPLAY_DATA_REGISTER   0xFE06 

#include "processor.hpp"


void openDisplay(char const * const path);
void closeDisplay();
void display(ProcessorState *pstate);

#endif // MEMORY_MAPPED_IO
