#ifndef INSTRUCTION_SET_LC_3
#define INSTRUCTION_SET_LC_3
#include <stdint.h>

#include "memory_maped_io.hpp"
#include "opcodes.hpp"
// Any instruction in here is implemented

typedef uint16_t word;
typedef uint8_t  byte;

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

#define EXEC_INSTR_BR(pstate)\


// op | dr |sr1 |immediate_flag| op_spec
struct ADD
{
	uint16_t op_spec : 5;
	uint16_t immediate : 1;
	uint16_t sr1 : 3;
	uint16_t dr  : 3;
};

#define EXEC_INSTR_ADD(pstate)\


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

/*
 * Note(Qwendo): Some men just want to see the world burn
 */

#define EXEC_INSTR_BR(pstate)\
	BRANCH b = *(BRANCH *)&current_instruction;\
	uint16_t offset = (((b.offset & 0x100) ? 0xFE00 : 0) | b.offset) << 1;\
	uint16_t target_address = pstate->pc + offset;\
	bool branch_taken = \
		(  b.n & pstate->status_register.negative \
		|| b.z & pstate->status_register.zero \
		|| b.p & pstate->status_register.positive\
		);\
	if(branch_taken)\
	{\
		warnUntouchedMemory(tracker, target_address);\
		pstate->pc = target_address;\
		markAddressTouched(tracker, target_address);\
	}\
	printf("BR  PC <- 0x%04x\tTaken %c\n"\
		, target_address\
		, branch_taken ? '1' : '0')

#define EXEC_INSTR_ADD(pstate)\
	ADD a = *(ADD *)&current_instruction;\
	uint16_t right_operand = 0;\
	printf("ADD %s <- %s + ", register_names[a.dr], register_names[a.sr1]);\
	if(a.immediate)\
	{\
		uint16_t immediate = ((a.op_spec & 0x0010) ? 0xFFE0 : 0 ) | a.op_spec;\
		right_operand = immediate;\
		printf("0x%04x", immediate);;\
	}else{\
		right_operand = pstate->registers[a.op_spec & 0b111];\
		printf("%s", register_names[a.op_spec & 0b111]);\
	}\
	pstate->registers[a.dr] = pstate->registers[a.sr1] + right_operand;\
	setFlagRegisters(pstate, pstate->registers[a.dr]);\
	printf("\n")

#define EXEC_INSTR_LDB(pstate)\
	LDB l = *(LDB *)&current_instruction;\
	uint16_t offset = ((0x10 & l.offset_6) ? 0xFFE0 : 0x0) | l.offset_6;\
	uint16_t address = pstate->registers[l.base_r] + offset;\
	warnUntouchedMemory(tracker, address);\
	markAddressTouched(tracker, address);\
	byte val = pstate->memory[address];\
	pstate->registers[l.dr] = ((0x80 & val) ? 0xFF00 : 0x0) | val;\
	setFlagRegisters(pstate, pstate->registers[l.dr]);\
	printf("LDB %s <- SEXT(MEM[0x%04x])\n", register_names[l.dr], address)

#define EXEC_INSTR_STB(pstate)\
	STB s = *(STB *)&current_instruction;\
	uint16_t address = pstate->registers[s.base_r] + (((0x0020 & s.offset_6) ? 0xFFC0 : 0x0000) | s.offset_6);\
	markAddressTouched(tracker, address);\
	pstate->memory[address] = (uint8_t)pstate->registers[s.sr];\
	if(*(word *)&pstate->memory[DISPLAY_DATA_REGISTER] != 0)\
	{\
		fprintf(display_out, "%c", (char)pstate->memory[DISPLAY_DATA_REGISTER]);\
		*(word *)&pstate->memory[DISPLAY_DATA_REGISTER] = 0x00;\
		fflush(display_out);\
	}\
	printf("STB 0x%04x <- %s\n", address, register_names[s.sr])


#define EXEC_INSTR_JSR(pstate)\
	pstate->registers[0b111] = pstate->pc;\
	JS j = *(JS *)&current_instruction;\
	printf("JSR ");\
	uint16_t effective_adress = 0;\
	if(j.immediate)\
	{\
		uint16_t immediate = ((uint16_t)((0b1<<10 & j.op_spec) ? 0xF800 : 0) | j.op_spec ) << 1;\
		effective_adress = pstate->pc + immediate;\
		printf("Offset 0x%04x with effective adress 0x%04x", immediate, effective_adress);\
	}else{\
		JSRR jsrr = *(JSRR *)&j;\
		effective_adress = pstate->registers[jsrr.base_r];\
		printf("Register %s with address 0x%04x", register_names[jsrr.base_r], pstate->registers[jsrr.base_r]);\
	}\
	printf("\n");\
	warnUntouchedMemory(tracker, effective_adress);\
	markAddressTouched(tracker, effective_adress);\
	pstate->pc = effective_adress;			\
	markAddressTouched(tracker, pstate->pc)

#define EXEC_INSTR_AND(pstate)\
	AND a = *(AND *)&current_instruction;\
	printf("AND %s <- %s AND ", register_names[a.dr], register_names[a.sr1]);\
	word right_operand = 0;\
	if(a.immediate)\
	{\
		uint16_t immediate = ((a.op_spec & 0x0010) ? 0xFFE0 : 0 ) | a.op_spec;\
		right_operand = immediate;\
		printf("0x%04x", immediate);\
	}else{\
		right_operand = pstate->registers[a.op_spec & 0b11];\
		printf("%s", register_names[a.op_spec & 0b111]);\
	}\
	pstate->registers[a.dr] = pstate->registers[a.sr1] & right_operand;\
	setFlagRegisters(pstate, pstate->registers[a.dr]);\
	printf("\n")

#define EXEC_INSTR_LDW(pstate)\
	LDW l = *(LDW *)&current_instruction;\
	assert(!(pstate->registers[l.base_r] & 0b1));\
	uint16_t immediate = (((0x0010 & l.offset_6) ? 0xFFE0 : 0 ) | l.offset_6) << 1;\
	uint16_t address = pstate->registers[l.base_r] + immediate;\
	warnUntouchedMemory(tracker, address);\
	markAddressTouched(tracker, address);\
	word loaded = *(word *)&pstate->memory[address];\
	setFlagRegisters(pstate, loaded); \
	pstate->registers[l.dr] = loaded;\
	printf("LDW %s <- MEM[0x%04x]\n", register_names[l.dr], address)

#define EXEC_INSTR_STW(pstate)\
	STW s = *(STW *)&current_instruction;\
	uint16_t address = pstate->registers[s.base_r] + ((((0x0020 & s.offset_6) ? 0xFFC0 : 0x0000) | s.offset_6)<<1);\
	markAddressTouched(tracker, address);\
	*(word *)&pstate->memory[address] = pstate->registers[s.sr];\
	if(*(word *)&pstate->memory[DISPLAY_DATA_REGISTER] != 0)\
	{\
		fprintf(display_out, "%c", (char)pstate->memory[DISPLAY_DATA_REGISTER]);\
		*(word *)&pstate->memory[DISPLAY_DATA_REGISTER] = 0x00;\
		fflush(display_out);\
	}\
	printf("STW 0x%04x <- %s\n", address, register_names[s.sr])


#define EXEC_INSTR_RTI(pstate)\
	if(pstate->status_register.priviledge_level == 1)\
	{\
		printf("Priviledge mode violation\nExiting\n");\
		exit(403);\
	}\
	pstate->pc = *(word *)&pstate->memory[pstate->registers[0b11]];\
	pstate->registers[0b110] = pstate->registers[0b110] + 2;\
	*(word *)&pstate->status_register = *(word *)&pstate->memory[pstate->registers[0b110]];\
	pstate->registers[0b110] = pstate->registers[0b110] + 2

#define EXEC_INSTR_XOR(pstate)\
	XOR n = *(XOR *)&current_instruction;\
	uint16_t value = 0;\
	if(n.immediate)\
	{\
		value = ((0x0010 & n.op_spec) ? 0xFFE0 : 0x0000) | n.op_spec;\
	}else{\
		value = pstate->registers[0b111 & n.op_spec];\
	}\
	pstate->registers[n.dr] = pstate->registers[n.sr] ^ value;\
	printf("XOR %s <- %s XOR 0x%04x\n", register_names[n.dr], register_names[n.sr], value);\
	setFlagRegisters(pstate, pstate->registers[n.dr])


#define EXEC_INSTR_RES_1(pstate)\
	printf("\nOp Code: 0x%01x is undefined in the current ISA\nExiting main loop\n", *(uint16_t *)&current_instruction);\
	markRangeTouched(tracker, pstate->pc - 0x100, 0x120);\
	pstate->memory[0xFFFF] &= 0x40

#define EXEC_INSTR_RES_2(pstate)\
	printf("0x%01x op_code is undefined in the current ISA\nExiting main loop\n", *(uint16_t *)&current_instruction);\
	markRangeTouched(tracker, pstate->pc - 0x100, 0x120);\
	pstate->memory[0xFFFF] &= 0x40

#define EXEC_INSTR_JMP(pstate)\
	JMP j = *(JMP *)&current_instruction;\
	printf("JUMP PC <- %s, jumping to Address 0x%04x\n", register_names[j.reg], pstate->registers[j.reg]);\
	pstate->pc = pstate->registers[j.reg];\
	warnUntouchedMemory(tracker, pstate->pc);\
	markAddressTouched(tracker, pstate->pc)

#define EXEC_INSTR_SHF(pstate)\
	SHF s = *(SHF *)&current_instruction;\
	uint16_t val = pstate->registers[s.sr];\
	if(s.dir)\
		printf("R");\
	else\
		printf("L");\
	printf("SHF");\
	if(s.dir)\
	{\
		uint16_t fill = 0;\
		if(s.arith)\
		{\
			printf("A");\
			bool sign =  (pstate->registers[s.sr] & 0x8000);\
			fill = sign ? 1 : 0;\
		}else{\
			printf("L");\
		}\
		for(int i = 0; i < s.ammt_4; i++)\
		{\
			val = val>>1 | (fill ? 0x8000 : 0x0000);\
		}\
	}else{\
		for(int i = 0; i < s.ammt_4; i++)\
		{\
			val = val<<1;\
		}\
	}\
	printf(" %s <- %s", register_names[s.dr], register_names[s.sr]);\
	if(s.dir)\
	{\
		printf(">>");\
		if(s.arith) printf("A");\
		else printf("L");\
	}else{\
		printf("<< ");\
	}\
	printf("0x%01x\n",(uint8_t)s.ammt_4);\
	pstate->registers[s.dr] = val;\
	setFlagRegisters(pstate, pstate->registers[s.dr])

#define EXEC_INSTR_LEA(pstate)\
	LEA l = *(LEA *)&current_instruction;\
	uint16_t address = (((l.offset_9 & 0x0100) ? 0xFE00 : 0x0000) | l.offset_9) << 1;\
	address += pstate->pc;\
	printf("LEA %s <- 0x%04x\n", register_names[l.dr], address);\
	pstate->registers[l.dr] = address;\
	setFlagRegisters(pstate, address)

#define EXEC_INSTR_TRAP(pstate)\
	TRAP t = *(TRAP *)&current_instruction;\
	pstate->registers[0b111] = pstate->pc;\
	uint16_t address = ((uint16_t)t.trap_vec_8) << 1;\
	printf("Raw Address 0x%04x\n", address);\
	address = *(word *)&pstate->memory[address];\
	warnUntouchedMemory(tracker, address);\
	pstate->pc = address;\
	printf("TRAP jumping to address 0x%04x\n0x%04x\n", address, t.trap_vec_8);\
	markAddressTouched(tracker, address)


#endif //INSTRUCTION_SET_LC_3
