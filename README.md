# CUDA Image Brightness Project

A CUDA-based project to adjust the brightness of grayscale images using GPU acceleration. Includes reading PGM images, applying brightness transformations, and saving the results as PGM and PNG files.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Directory Structure](#directory-structure)
- [Requirements](#requirements)
- [How to Run](#how-to-run)
- [Sample Output](#sample-output)
- [Author](#author)

---

## Project Overview
This project demonstrates GPU-accelerated image processing using CUDA. The main focus is on modifying the brightness of grayscale images in the PGM format.

---

## Features
- Reads binary PGM (`P5`) grayscale images.
- Applies brightness adjustments on GPU using CUDA.
- Saves results as both `.pgm` and `.png`.
- Minimal dependencies, easy to run.

---

## Directory Structure
```

cuda-brightness-project/
│
├─ data/
│  └─ lena.pgm
│
├─ output/
│  ├─ result.pgm
│  └─ result.png
│
├─ src/
│  ├─ brightness/
│  ├─ image_utils.cpp
│  ├─ image_utils.h
│  ├─ main.cu
│  ├─ Makefile
│  ├─ run.sh
│  └─ stb_image_write.h
│
└─ README.md

````

---

## Requirements
- NVIDIA GPU with CUDA support
- CUDA Toolkit installed
- GCC or compatible C++ compiler

---

## How to Run
1. Navigate to the project directory:
```bash
cd cuda-brightness-project
````

2. Build the project using the provided Makefile:

```bash
make
```

3. Run the program:

```bash
./run.sh
```

4. Output images will be generated in the `output/` folder.

---

## Sample Output

* `result.pgm` → Processed PGM image
* `result.png` → PNG version of the processed image

---

