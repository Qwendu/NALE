#include "processor.hpp"
#include "Instruction_set.hpp"
#include <stdint.h>
#include <stdio.h>

/* 
When TRACK_MEMORY is not defined every function 
in this .cpp file will return 0 in the corresponding type
*/


struct MemoryTracker
{
	uint64_t field[memory_size/64 + 1];
};


MemoryTracker *
createMemoryTracker()
#ifdef TRACK_MEMORY
{
	MemoryTracker *mem = (MemoryTracker *)malloc(sizeof(MemoryTracker));
	assert(mem != 0);
	memset(mem, 0, sizeof(MemoryTracker));
	return mem;
}
#else
{
	return 0;
}
#endif // TRACK_MEMORY



void markAddressTouched(MemoryTracker *mem, uint16_t address)
#ifdef TRACK_MEMORY
{
	mem->field[address/64] |= 1<<(address%64);
}
#else
{

}
#endif // TRACK_MEMORY

bool getAddressTouched(MemoryTracker *mem, uint16_t address)
#ifdef TRACK_MEMORY
{
	bool b = mem->field[address/64] & ((uint64_t)1<<(address%64));
	return b;
}
#else
{
	return 0;
}
#endif // TRACK_MEMORY

void markRangeTouched(MemoryTracker *mem, uint16_t address, uint16_t range_exclusive)
#ifdef TRACK_MEMORY
{
	for(int i = 0; i < range_exclusive; i++)
	{
		markAddressTouched(mem, address + i);
	}
}
#else
{}
#endif //TRACK_MEMORY

char printable(char ch)
{
    if ('A' <= ch && ch <= 'Z') {
        return ch;
    }
    if ('a' <= ch && ch <= 'z') {
        return ch;
    }
    if ('0' <= ch && ch <= '9') {
        return ch;
    }
    return '.';
}

void printTouchedMemory(MemoryTracker *mem, byte *base)
#ifdef TRACK_MEMORY
{
	printf("MEMORY: ------\n");
	printf("ADDRESS:\t");
	for(int i = 0; i < 8; i++)
	{
		if(i % 4 == 0 && i != 0) printf("\t");
		printf("  %01x  %01x ", 2 * i, 2*i + 1);
	}
	printf("\n");
	for(int i = 0; i < (int)memory_size; i += 16)
	{
		bool print = false;
		for(int j = i; j < i + 16; j++)
		{
			print |= getAddressTouched(mem, j);
		}
		if(print)
		{
            char as_ascii[17];
            as_ascii[16] = 0;
            int char_index = 0;
			printf("0x%04x: ", (uint16_t)i);
			for(int j = i; j < i + 16; j+=2)
			{
				if(j % 8 == 0) printf("\t");
				printf("0x%02x%02x ", base[j], base[j + 1]);
                as_ascii[char_index++] = printable(base[j]);
                as_ascii[char_index++] = printable(base[j+1]);
			}
            printf("\t%s\n", as_ascii);
		}
	}
	printf("/MEMORY ------\n");
}
#else
{}
#endif

void warnUntouchedMemory(MemoryTracker *mem, uint16_t address)
#ifdef TRACK_MEMORY
{
	if(!getAddressTouched(mem, address))
	{
		fprintf(stderr, "WARNING: The Address 0x%04x has never been stored to.\n", address);
	}
}
#else
{
}
#endif //TRACK_MEMORY

