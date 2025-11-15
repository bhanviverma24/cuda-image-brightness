#ifndef IMAGE_UTILS_H
#define IMAGE_UTILS_H

#include <string>

struct Image
{
    int width;
    int height;
    unsigned char *data;
};

Image loadPGM(const std::string &filename);
void savePGM(const std::string &filename, const Image &image);
void savePNG(const std::string &filename, const unsigned char *data, int width, int height);

#endif
