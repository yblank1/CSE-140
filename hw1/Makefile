compile:
	mkdir -p buildDir
	bsc -u -sim -bdir buildDir -info-dir buildDir -simdir buildDir -vdir buildDir -aggressive-conditions Tb.bsv

sim: compile
	bsc -sim -e mkTb -bdir buildDir -info-dir buildDir -simdir buildDir -o sim

all: sim

clean:
	rm -rf buildDir sim*

.PHONY: clean all sim compile
.DEFAULT_GOAL := all
