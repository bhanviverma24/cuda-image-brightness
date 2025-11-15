#include "image_utils.h"
#include <fstream>
#include <iostream>
#include <vector>
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

// Load PGM (P5 format)
Image loadPGM(const std::string &filename)
{
    std::ifstream file(filename, std::ios::binary);
    if (!file)
    {
        std::cerr << "Cannot open file: " << filename << std::endl;
        exit(1);
    }

    std::string magic;
    file >> magic;
    if (magic != "P5")
    {
        std::cerr << "Only P5 PGM files supported" << std::endl;
        exit(1);
    }

    int width, height, maxVal;
    file >> width >> height >> maxVal;
    file.get(); // consume newline

    Image img;
    img.width = width;
    img.height = height;
    img.data = new unsigned char[width * height];
    file.read(reinterpret_cast<char *>(img.data), width * height);

    return img;
}

// Save PGM
void savePGM(const std::string &filename, const Image &img)
{
    std::ofstream file(filename, std::ios::binary);
    file << "P5\n"
         << img.width << " " << img.height << "\n255\n";
    file.write(reinterpret_cast<char *>(img.data), img.width * img.height);
}

// Save PNG
void savePNG(const std::string &filename, const unsigned char *data, int width, int height)
{
    stbi_write_png(filename.c_str(), width, height, 1, data, width);
}
