ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

OPENSCAD := openscad

SRC_TYPE := scad
OUT_TYPE := stl

SRC := $(ROOT_DIR)/src
OUT := $(ROOT_DIR)/out

SOURCES := $(wildcard $(SRC)/*.$(SRC_TYPE))
OBJECTS := $(patsubst $(SRC)/%.$(SRC_TYPE), %.$(OUT_TYPE), $(SOURCES))

all: $(OBJECTS)

clean:
	rm -rf $(OUT)

$(OBJECTS): %.$(OUT_TYPE): $(SRC)/%.$(SRC_TYPE)
	mkdir -p $(OUT)
	$(OPENSCAD) -o $(OUT)/$@ $^
