/*
This code contains some extra general optimization techniques: register spilling, replace int with uint8_t and uint16_t where is applicable
*/

#include <stdint.h>
#include <stdio.h>
#include <time.h>

#define WIDTH 320
#define HEIGHT 240

#define BITS_PER_PIXEL_OFFSET 0x001C
#define DATA_OFFSET_OFFSET 0x000A
#define UINT16_T_MAX 65535

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

static inline uint16_t calc_block_diff(uint16_t x_first_pixel, uint16_t y_first_pixel, 
                                        uint16_t x_second_pixel, uint16_t y_second_pixel, 
                                        uint8_t image_first[HEIGHT][WIDTH], uint8_t image_second[HEIGHT][WIDTH])
{
    uint16_t SAD_temp = 0;
    uint8_t x, y;
    for (x = 0; x < 16; x++)
    {
        for (y = 0; y < 16; y++)
        {
            int16_t diff = image_second[y_second_pixel + y][x_second_pixel + x] - image_first[y_first_pixel + y][x_first_pixel + x];
            if (diff < 0)
            {
                SAD_temp -= diff;
            }
            else
            {
                SAD_temp += diff;
            }
        }
    }
    return SAD_temp;
}

int main(void)
{
    //clock_t start = clock();
    uint8_t image_first[HEIGHT][WIDTH];
    uint8_t image_second[HEIGHT][WIDTH];
    readImage("frame_1.bmp", image_first);
    readImage("frame_2.bmp", image_second);
    int8_t min_SAD_vals[15][20][2] = {};
    uint8_t y_first, x_first;
    // For each 16x16 block in first image
    for (x_first = 0; x_first < 20; x_first++)
    {
        uint16_t x_first_pixel = x_first * 16;
        for (y_first = 0; y_first < 15; y_first++)
        { 
            uint16_t y_first_pixel = y_first * 16;
            // Min SAD value for the current block
            uint16_t min_SAD = UINT16_T_MAX;
            // Block with the associated min SAD value
            uint8_t min_x, min_y = 0;
            // For each 16x16 block in second image
            register uint8_t y_second, x_second;
            for (x_second = 0; x_second < 20; x_second++)
            {
                uint16_t x_second_pixel = x_second * 16;
                for (y_second = 0; y_second < 15; y_second++)
                {
                    uint16_t y_second_pixel = y_second * 16;
                    // Calculate SAD value for pair of blocks
                    uint16_t SAD_temp = calc_block_diff(x_first_pixel, y_first_pixel, 
                                                    x_second_pixel, y_second_pixel, 
                                                    image_first, image_second);
                    // Check if this SAD value is lower than the current minimum
                    if(SAD_temp < min_SAD)
                    {
                        min_SAD = SAD_temp;
                        min_x = x_second;
                        min_y = y_second;
                    }   
                }
            }
            // r for the block with the min SAD value
            min_SAD_vals[y_first][x_first][0] = min_x - x_first;
            // s for the block with the min SAD value
            min_SAD_vals[y_first][x_first][1] = min_y - y_first;
            // Print the r and s corresponding to the smallest SAD for current block
            printf("block [%i][%i] has motion vector (%i, %i)\n", y_first, x_first, 
                                                        min_SAD_vals[y_first][x_first][0], 
                                                        min_SAD_vals[y_first][x_first][1]);
        }
    }
}
