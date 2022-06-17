#!/usr/bin/env python3

from pathlib import Path
import sys
import os

TARGET_DIR = Path("./target")
cflags = "-Wall -Wextra -Wpedantic -Wno-gnu-label-as-value  -Wno-unused-parameter -std=c++20" # If the memory tracker is not defined, then -Wno-unused will flood the console

def build(cc, ofile, cflags):
    if not TARGET_DIR.is_dir():
        TARGET_DIR.mkdir()

    run_cmd(f"{cc} main.cpp -o {ofile} {cflags}")

def run_cmd(cmd, fail_on_err=True):
    print(f"[RUNNING] {cmd}")
    code = os.system(cmd)
    if code != 0 and fail_on_err:
        exit(code)

run = True
if "--build-only" in sys.argv:
    run = False


prog = "test.bin"
if "--bin" in sys.argv:
    index = sys.argv.index("--bin")
    if len(sys.argv) == index + 1:
        print("--bin expects argument")
        exit(-1)
    else:
        prog = sys.argv[index + 1]
        if not prog.endswith(".bin"):
            print(f"program must end with .bin received: {prog}")
            exit(-1)


if "--chasm" in sys.argv:
    if "--rebuild-chasm" in sys.argv:
        run_cmd("cd ../chasm && cargo build")
    cflags += " -L../chasm/target/debug -lchasm"


cc = ""
ofile = None
if os.name == "nt":
    cc = "clang++"
    ofile = TARGET_DIR / Path("lc3.exe")
if os.name == "posix":
    cc = "g++"
    if "clang" in sys.argv:
        cc = "clang++"
    ofile = TARGET_DIR / Path("lc3")

def build_and_run():
    build(cc, ofile, cflags)
    interactive = "-I"
    if "no-interactive" in sys.argv:
        interactive = ""
    if run:
        run_cmd(f"'{ofile}' '{prog}' {interactive}")

build_and_run()
