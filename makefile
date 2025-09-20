ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

OPENSCAD := openscad --enable=lazy-union

SRC_TYPE := scad
OUT_TYPE := 3mf

SRC := $(ROOT_DIR)/src
OUT := $(ROOT_DIR)/out

SOURCES := $(wildcard $(SRC)/*.$(SRC_TYPE))
OBJECTS := $(patsubst $(SRC)/%.$(SRC_TYPE), $(OUT)/%.$(OUT_TYPE), $(SOURCES))

all: $(OBJECTS)

clean:
	rm -rf $(OUT)

$(OUT)/%.$(OUT_TYPE): $(SRC)/%.$(SRC_TYPE) | $(OUT)
	$(OPENSCAD) -o $@ $^

$(OUT):
	mkdir $(OUT)

.PHONY: clean
