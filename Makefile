RISCV_TESTS_DIR := ../rocket-chip/riscv-tools/riscv-tests/

all: help

help:
	@echo "RISCV_TESTS_DIR must point to a rocket-chip/riscv-tools/riscv-tests/"
	@echo ""
	@echo "Make the tests in a rocket-chip directory:"
	@echo ""
	@echo "cd ${RISCV_TESTS_DIR}/isa"
	@echo "export RISCV=~/Git/rocket-chip-build"
	@echo "PATH=$RISCV/bin:$PATH"
	@echo "make clean"
	@echo "make XLEN=32"
	@echo ""
	@echo "To copy tests in from a riscv-tests directory:"
	@echo "make copy_tests"

copy_tests:
	(cd ${RISCV_TESTS_DIR}; find . -name *.dump | tar cf - --files-from -) | tar xf -
