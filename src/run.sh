#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <brightness>"
    exit 1
fi

BRIGHTNESS=$1

# Run CUDA program
./brightness ../data/lena.pgm ../output/result.pgm $BRIGHTNESS
echo "Saved output PGM: ../output/result.pgm"
echo "Saved output PNG: ../output/result.png"
echo "Done."
