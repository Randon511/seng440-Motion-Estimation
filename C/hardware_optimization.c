/*
This code contains hardware optimization
*/

#include <stdio.h>
#include <stdint.h>
// Maximum value for an integer
#define INT_MAX 2147483647
#define WIDTH 320
#define HEIGHT 240

#define BITS_PER_PIXEL_OFFSET 0x001C
#define DATA_OFFSET_OFFSET 0x000A

static void readImage(char filename[], uint8_t pixels[HEIGHT][WIDTH])
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

static int calc_block_diff(int x_first_pixel, int y_first_pixel,
                            int x_second_pixel, int y_second_pixel, 
                            uint8_t image_first[HEIGHT][WIDTH], uint8_t image_second[HEIGHT][WIDTH])
{
    int SAD_temp = 0;
    register int x, y, Rs1, Rs2, Rt;
    __asm__ ( "RESET_SAD %1, %2, %0" : " = r " ( Rt ) : " r " ( Rs1 ) , " r " ( Rs2 ) ) ;
    for (x = 0; x < 16; x++)
    {
        for (y = 0; y < 16; y+=4)
        {
            Rs1 = image_first[y_first_pixel + y][x_first_pixel + x] << 24 +
                                image_first[y_first_pixel + y + 1][x_first_pixel + x] << 16 + 
                                image_first[y_first_pixel + y + 2][x_first_pixel + x] << 8 +
                                image_first[y_first_pixel + y + 3][x_first_pixel + x];
            Rs2 = image_second[y_first_pixel + y][x_first_pixel + x] << 24 +
                                image_second[y_first_pixel + y + 1][x_first_pixel + x] << 16 + 
                                image_second[y_first_pixel + y + 2][x_first_pixel + x] << 8 +
                                image_second[y_first_pixel + y + 3][x_first_pixel + x];
            __asm__ ( "SAD %1, %2, %0" : " = r " ( Rt ) : " r " ( Rs1 ) , " r " ( Rs2 ) ) ;
            SAD_temp += Rt;
        }
    }
    return SAD_temp;
}

int main(void)
{
    uint8_t image_first[HEIGHT][WIDTH];
    uint8_t image_second[HEIGHT][WIDTH];
    readImage("frame_1.bmp", image_first);
    readImage("frame_2.bmp", image_second);
    int min_SAD_vals[15][20][3] = {};
    int y_first, x_first;
    // For each 16x16 block in first image
    for (x_first = 0; x_first < 20; x_first++)
    {
        int x_first_pixel = x_first * 16;
        for (y_first = 0; y_first < 15; y_first++)
        { 
            int y_first_pixel = y_first * 16;
            // Min SAD value for the current block
            int min_SAD = INT_MAX;
            // Block with the associated min SAD value
            int min_x, min_y = -1;
            // For each 16x16 block in second image
            int y_second, x_second;
            for (x_second = 0; x_second < 20; x_second++)
            {
                int x_second_pixel = x_second * 16;
                for (y_second = 0; y_second < 15; y_second++)
                {
                    int y_second_pixel = y_second * 16;
                    // Calculate SAD value for pair of blocks
                    int SAD_temp = calc_block_diff(x_first_pixel, y_first_pixel, 
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
            // Min SAD value found
            min_SAD_vals[y_first][x_first][0] = min_SAD;
            // r for the block with the min SAD value
            min_SAD_vals[y_first][x_first][1] = min_x - x_first;
            // s for the block with the min SAD value
            min_SAD_vals[y_first][x_first][2] = min_y - y_first;
            // Print the r and s corresponding to the smallest SAD for current block
            printf("block [%i][%i] has motion vector (%i, %i)\n", y_first, x_first, 
                                                        min_SAD_vals[y_first][x_first][1], min_SAD_vals[y_first][x_first][2]);
        }
    }
}