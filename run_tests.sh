#!/bin/bash

# An advanced script to compile, run, and verify miniPascal tests.
# This version assumes the compiler writes output files directly to the OUTPUT_DIR.

# --- Configuration ---
COMPILER_EXE="./my_compiler.exe"
VM_EXE="./vm.exe"
TESTS_DIR="./Tests"
OUTPUT_DIR="./output"

# --- Colors for Output ---
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# --- Pre-run Checks ---

# Ensure the compiler exists
if [ ! -f "$COMPILER_EXE" ]; then
    echo -e "${RED}Error: Compiler executable '$COMPILER_EXE' not found.${NC}"
    echo "Please run 'make' to build the project first."
    exit 1
fi

# Ensure the VM exists
if [ ! -f "$VM_EXE" ]; then
    echo -e "${RED}Error: VM executable '$VM_EXE' not found.${NC}"
    exit 1
fi

# --- Main Logic ---

# Loop through all .pas files in the tests directory
for test_file in ${TESTS_DIR}/*.pas; do
    if [ ! -f "$test_file" ]; then
        echo -e "${YELLOW}Warning: No test files (*.pas) found in the '$TESTS_DIR' directory.${NC}"
        break
    fi

    # Get the base filename without path or extension (e.g., "Test00")
    base_name=$(basename "$test_file" .pas)
    
    # Construct the name of the assembly file and its full path
    assembly_file_name="${base_name}.assembly.vm"
    assembly_file_path="${OUTPUT_DIR}/${assembly_file_name}"

    # --- Test Header ---
    echo "========================================="
    echo -e "Running test: ${YELLOW}${base_name}${NC}"
    echo "-----------------------------------------"

    # --- Step 1: Compile the code ---
    echo "Compiling..."
    # The compiler will output its own status message.
    ${COMPILER_EXE} ${test_file}

    # Check the exit code of the compiler
    if [ $? -ne 0 ]; then
        echo -e "${RED}==> COMPILE FAILED${NC}"
        echo "" # Add spacing
        continue 
    fi
    echo -e "${GREEN}Compile successful.${NC}"
    echo "" # Add spacing

    # --- Step 2: Verify Output and Run VM ---
    
    # Check if the compiler produced the assembly file in the correct output directory.
    if [ ! -f "$assembly_file_path" ]; then
        echo -e "${RED}Error: Assembly file '$assembly_file_path' was not found after compilation.${NC}"
        echo -e "${RED}==> TEST FAILED${NC}"
        echo ""
        continue
    fi
    
    echo "Executing on VM..."
    echo "--- VM Output ---"
    
    # Run the VM on the file located inside the output directory
    vm_output=$(${VM_EXE} ${assembly_file_path})
    vm_exit_code=$?
    
    echo -e "${CYAN}${vm_output}${NC}"
    echo "-----------------"

    # Check the exit code of the VM
    if [ ${vm_exit_code} -ne 0 ]; then
        echo -e "${RED}==> EXECUTION FAILED (VM returned non-zero exit code)${NC}"
    else
        echo -e "${GREEN}==> TEST PASSED${NC}"
    fi
    
    echo "" # Add final spacing
done

echo "All tests finished."
