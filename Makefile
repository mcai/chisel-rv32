DIRS = src/main/cc/benchmark sim

all: sim/Cpu.v test

sim/Cpu.v: src/main/scala/rv32/*.scala
	sbt 'run sim'

test:
	for d in $(DIRS); do make -C $$d test; done

clean:
	for d in $(DIRS); do make -C $$d clean; done
	rm -rf project target test_run_dir sim/Cpu.*

.PHONY: all test clean
