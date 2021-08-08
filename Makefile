# a makefile

SHELL := /bin/bash

PROGRAMS := $(patsubst src/%.cc, bin/%, $(shell echo `ls src/*.cc`))

ifeq ($(DEBUG),1)
   OPTFLAGS := -O1
else
   OPTFLAGS := -O2
endif

# common build flags
CXXOPTS := -std=c++17 $(OPTFLAGS)
LDFLAGS :=

$(shell mkdir -p bin/ >& /dev/null)

all: $(PROGRAMS)

bin/%: src/%.cc
	@echo "  ▸ [BIN] $(notdir $@)"
	@$(CXX) $(CXXOPTS) -o $@ $<
