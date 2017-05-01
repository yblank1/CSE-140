compile:
	mkdir -p buildDir
	bsc -u -sim -bdir buildDir -info-dir buildDir -simdir buildDir -vdir buildDir -aggressive-conditions Tb.bsv

simBCM: compile
	bsc -sim -e mkTbBCM -bdir buildDir -info-dir buildDir -simdir buildDir -o simBCM

simPE: compile
	bsc -sim -e mkTbPE -bdir buildDir -info-dir buildDir -simdir buildDir -o simPE

all: simBCM simPE

clean:
	rm -rf buildDir sim*

.PHONY: clean all simBCM simPE compile
.DEFAULT_GOAL := all
