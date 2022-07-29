// no optimization at all

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define WIDTH 320
#define HEIGHT 240

#define BITS_PER_PIXEL_OFFSET 0x001C
#define DATA_OFFSET_OFFSET 0x000A

static inline void readImage(char filename[], uint8_t pixels[HEIGHT][WIDTH])
{
    FILE *bmp = fopen(filename, "rb");
    // find pixel data offset
    uint32_t dataOffset;
    fseek(bmp, DATA_OFFSET_OFFSET, SEEK_SET);
    fread(&dataOffset, 4, 1, bmp);
    // find bit per pixel
    uint32_t bitsPerPixel;
    fseek(bmp, BITS_PER_PIXEL_OFFSET, SEEK_SET);
    fread(&bitsPerPixel, 2, 1, bmp);
    uint32_t bytesPerPixel = bitsPerPixel / 8;
    uint32_t paddedRowSize = WIDTH * bytesPerPixel;
    // save pixel data to array
    uint32_t i,j;
    for (i = 0; i < HEIGHT; i++)
    {
        for (j = 0; j < WIDTH; j++)
        {
            // save only RGB part, discard Alpha part
            fseek(bmp, dataOffset+(i*paddedRowSize) + j*bytesPerPixel, SEEK_SET);
            fread(&pixels[HEIGHT-1-i][j], 1, 1, bmp);
        }
    }
    fclose(bmp);
}



int calc_block_diff(int x_first, int y_first, int x_second, int y_second, uint8_t image_first[HEIGHT][WIDTH], uint8_t image_second[HEIGHT][WIDTH]){
    int SAD = 0;
    for (int x = 0; x < 16; x++)
    {
        for (int y = 0; y <16; y++)
        {
            SAD += abs(image_second[x_second + x][y_second + y] - image_first[x_first + x][y_first + y]);
        }
    }   
    return SAD;
}

int main(void)
{
    uint8_t image_first[HEIGHT][WIDTH];
    uint8_t image_second[HEIGHT][WIDTH];
    readImage("frame_1.bmp", image_first);
    readImage("frame_2.bmp", image_second);
    // for each 16x16 block in first image
    for (int x_first = 0; x_first < 20; x_first++)
    {
        for (int y_first = 0; y_first < 15; y_first++)
        {
            int SAD_temp[20][15] = {}; 
            // for each 16x16 block in second image
            for (int x_second = 0; x_second < 20; x_second++)
            {
                for (int y_second =0; y_second < 15; y_second++)
                {
                    // calculate SAD value for pair of image_second[x_second][y_second] and image_first[x_first][y_first]
                    SAD_temp[x_second][y_second] = calc_block_diff(x_first, y_first, x_second, y_second, image_first, image_second);
                    
                }
            }    
            // scan for the smallest SAD for image_first[x_first][y_first] block
            int smallest_SAD = SAD_temp[0][0];
            int r, s;
            for (int i = 0 ; i < 20 ; i++)
            {
                for (int j = 0 ; j < 15 ; j++)
                {
                    if (SAD_temp[i][j] < smallest_SAD)
                    {
                        smallest_SAD = SAD_temp[i][j];
                        r = i - x_first;
                        s = j - y_first;
                    }
                }
            }
            // print the r and s corresponding to the smallest SAD for image_first[x_first][y_first] block
            printf("block [%i][%i] has motion vector (%i, %i)\n", x_first, y_first, r, s);
        }
    }
}