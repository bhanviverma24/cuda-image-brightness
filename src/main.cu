#include <iostream>
#include <cuda_runtime.h>
#include "image_utils.h"

__global__ void brightnessKernel(unsigned char* input, unsigned char* output,
                                 int width, int height, int brightness) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int idx = y * width + x;
        int value = input[idx] + brightness;
        if (value > 255) value = 255;
        if (value < 0) value = 0;
        output[idx] = value;
    }
}

int main(int argc, char** argv) {
    if (argc != 4) {
        std::cout << "Usage: ./brightness <input.pgm> <output.pgm> <brightness>\n";
        return 1;
    }

    std::string inputFile = argv[1];
    std::string outputFile = argv[2];
    int brightness = std::stoi(argv[3]);

    Image img = loadPGM(inputFile);
    int imgSize = img.width * img.height;

    unsigned char *d_in, *d_out;
    cudaMalloc(&d_in, imgSize);
    cudaMalloc(&d_out, imgSize);
    cudaMemcpy(d_in, img.data, imgSize, cudaMemcpyHostToDevice);

    dim3 block(16, 16);
    dim3 grid((img.width + 15) / 16, (img.height + 15) / 16);
    brightnessKernel<<<grid, block>>>(d_in, d_out, img.width, img.height, brightness);
    cudaDeviceSynchronize();

    cudaMemcpy(img.data, d_out, imgSize, cudaMemcpyDeviceToHost);

    // Save PGM
    savePGM(outputFile, img);
    std::cout << "Saved output PGM: " << outputFile << std::endl;

    // Save PNG
    std::string pngOutput = "../output/result.png";
    savePNG(pngOutput, img.data, img.width, img.height);
    std::cout << "Saved output PNG: " << pngOutput << std::endl;

    cudaFree(d_in);
    cudaFree(d_out);
    delete[] img.data;

    return 0;
}
