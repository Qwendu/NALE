#ifndef MEMORY_TRACKER_HPP
#define MEMORY_TRACKER_HPP

#include "FeatureFlags.hpp"


#include <stdint.h>
#include <stdio.h>
#include "processor.hpp"


struct MemoryTracker
{
	uint64_t field[memory_size/64 + 1];
};


MemoryTracker *createMemoryTracker();



void markAddressTouched(MemoryTracker *mem, uint16_t address);

bool getAddressTouched(MemoryTracker *mem, uint16_t address);

void markRangeTouched(MemoryTracker *mem, uint16_t address, uint16_t range_exclusive);

char printable(char ch);

void printTouchedMemory(MemoryTracker *mem, uint8_t *base);

void warnUntouchedMemory(MemoryTracker *mem, uint16_t address);


#endif //MEMORY_TRACKER_HPP

