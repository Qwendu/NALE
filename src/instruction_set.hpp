#ifndef INSTRUCTION_SET_LC_3
#define INSTRUCTION_SET_LC_3
#include <stdint.h>


#include "FeatureFlags.hpp"
#include "processor.hpp"
#include "memory_mapped_io.hpp"
#include "memory_tracker.hpp"

constexpr uint8_t INSTR_BR     = 0b0000;
constexpr uint8_t INSTR_ADD    = 0b0001;
constexpr uint8_t INSTR_LDB    = 0b0010;
constexpr uint8_t INSTR_STB    = 0b0011;
constexpr uint8_t INSTR_JSR    = 0b0100;
constexpr uint8_t INSTR_AND    = 0b0101;
constexpr uint8_t INSTR_LDW    = 0b0110;
constexpr uint8_t INSTR_STW    = 0b0111;
constexpr uint8_t INSTR_RTI    = 0b1000;
constexpr uint8_t INSTR_XOR    = 0b1001;
constexpr uint8_t INSTR_RES_1  = 0b1010;
constexpr uint8_t INSTR_RES_2  = 0b1011;
constexpr uint8_t INSTR_JMP    = 0b1100;
constexpr uint8_t INSTR_SHF    = 0b1101;
constexpr uint8_t INSTR_LEA    = 0b1110;
constexpr uint8_t INSTR_TRAP   = 0b1111;



struct Instruction
{
	uint16_t remainder : 12;
	uint16_t op_code   : 4 ;
};


// op|n|z|p|offset9
struct BRANCH
{
	uint16_t offset : 9;
	uint16_t p      : 1;
	uint16_t z      : 1;
	uint16_t n      : 1;
};

// op | dr |sr1 |immediate_flag| op_spec
struct ADD
{
	uint16_t op_spec : 5;
	uint16_t immediate : 1;
	uint16_t sr1 : 3;
	uint16_t dr  : 3;
};


struct AND
{
	uint16_t op_spec   : 5;
	uint16_t immediate : 1;
	uint16_t sr1 : 3;
	uint16_t dr  : 3;
};

struct JMP
{
	uint16_t unused  : 6;
	uint16_t reg     : 3;
	uint16_t unused2 : 3;
};

struct JS
{	
	uint16_t op_spec   : 11;
	uint16_t immediate : 1;
};

struct JSRR
{
	uint16_t unused : 6;
	uint16_t base_r : 3;
};

struct LDB
{
	uint16_t offset_6 : 6;
	uint16_t base_r   : 3;
	uint16_t dr       : 3;
};

struct LDW
{
	uint16_t offset_6 : 6;
	uint16_t base_r   : 3;
	uint16_t dr       : 3;
};

struct LEA
{
	uint16_t offset_9 : 9;
	uint16_t dr       : 3;
};

struct XOR
{
	uint16_t op_spec : 5;
	uint16_t immediate : 1;
	uint16_t sr : 3;
	uint16_t dr : 3;
};

struct SHF
{
	uint16_t ammt_4 : 4;
	uint16_t dir    : 1;
	uint16_t arith  : 1;
	uint16_t sr : 3;
	uint16_t dr : 3;
};

struct STB
{
	uint16_t offset_6 : 6;
	uint16_t base_r : 3;
	uint16_t sr : 3;
};

struct STW
{
	uint16_t offset_6 : 6;
	uint16_t base_r : 3;
	uint16_t sr : 3;
};

struct TRAP
{
	uint16_t trap_vec_8 : 8;
};

struct RTI
{
	uint16_t reserved;
};



void exec_instr_br(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_add(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_ldb(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_stb(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_jsr(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_and(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_ldw(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_stw(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_rti(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_xor(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_res_1(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_res_2(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_jmp(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_shf(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_lea(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);
void exec_instr_trap(ProcessorState *pstate, Instruction current_instruction, MemoryTracker *);

#endif //INSTRUCTION_SET_LC_3
