NVCC = nvcc
SRC = main.cu image_utils.cpp
INC = -I.
OUT = brightness

all: build

build:
	$(NVCC) $(SRC) -o $(OUT)

clean:
	rm -f brightness
