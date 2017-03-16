all: help

help:
	@echo "To copy tests in from a riscv-tests directory, do make copy_tests"

copy_tests:
	(cd ../riscv-tests; find . -name *.dump | tar cf - --files-from -) | tar xf -
