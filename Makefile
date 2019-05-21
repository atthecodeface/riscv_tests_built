RISCV_TESTS_DIR := ../rocket-chip/riscv-tools/riscv-tests/

all: help

help:
	@echo "RISCV_TESTS_DIR must point to a rocket-chip/riscv-tools/riscv-tests/"
	@echo ""
	@echo "Make the tests in a rocket-chip directory:"
	@echo ""
	@echo "export RISCV_TESTS_DIR=${RISCV_TESTS_DIR}"
	@echo "export RISCV_GNU_TOOLS=~/Git/riscv-gnu-tools"
	@echo "PATH=\$$RISCV_GNU_TOOLS/bin:\$$PATH"
	@echo "cd \$${RISCV_TESTS_DIR}/isa"
	@echo "make clean"
	@echo "make XLEN=32"
	@echo "make RISCV_PREFIX=riscv64-unknown-elf- XLEN=32 -k"
	@echo ""
	@echo "To copy tests in from a riscv-tests directory:"
	@echo "make copy_tests"

copy_tests:
	(cd ${RISCV_TESTS_DIR}; find . -name *.dump | tar cf - --files-from -) | tar xf -
	(cd ${RISCV_TESTS_DIR}; find . -name *.dump | sed s/\.dump// | tar cf - --files-from -) | tar xf -
