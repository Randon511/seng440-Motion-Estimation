#include <stdio.h>
#include <stdint.h>
#include <time.h>
// Maximum value for an integer
#define INT_MAX 2147483647
#define WIDTH 320
#define HEIGHT 240

#define BITS_PER_PIXEL_OFFSET 0x001C
#define DATA_OFFSET_OFFSET 0x000A


void readImage(char filename[], uint32_t pixels[HEIGHT][WIDTH])
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
            fseek(bmp, dataOffset+(i*paddedRowSize) + j*bytesPerPixel + 1, SEEK_SET);
            fread(&pixels[i][j], 1, bytesPerPixel - 1, bmp);
        }
    }
    fclose(bmp);
}

int main(void)
{
    for(int trials = 0; trials < 15; trials++)
    {
        clock_t start = clock();
        uint32_t image_first[HEIGHT][WIDTH];
        uint32_t image_second[HEIGHT][WIDTH];
        readImage("frame_1.bmp", image_first);
        readImage("frame_2.bmp", image_second);
        // printf("%08jx and %08jx ", image_first[0][0], image_second[0][0]);
        
        int min_SAD_vals[15][20][3] = {};
        int y_first, x_first;
        // For each 16x16 block in first image
        for (y_first = 0; y_first < 15; y_first++)
        {
            for (x_first = 0; x_first < 20; x_first++)
            { 
                // Min SAD value for the current block
                int min_SAD = INT_MAX;
                // Block with the associated min SAD value
                int min_x, min_y = -1;
                int y_second, x_second;
                // For each 16x16 block in second image
                for (y_second =0; y_second < 15; y_second++)
                {
                    for (x_second = 0; x_second < 20; x_second++)
                    {
                        int y,x;
                        // Calculate SAD value for pair of image_second[x_second][y_second] and image_first[x_first][y_first]
                        int SAD_temp = 0;
                        for (y = 0; y <16; y++)
                        {
                            for (x = 0; x < 16; x++)
                            {
                                int diff = image_second[x_second + x][y_second + y] - image_first[x_first + x][y_first + y];
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

                // Print the r and s corresponding to the smallest SAD for image_first[x_first][y_first] block
                //printf("block [%i][%i] has motion vector (%i, %i)\n", y_first, x_first, min_SAD_vals[y_first][x_first][1], min_SAD_vals[y_first][x_first][2]);
                /*
                    --- may need a better way to print (r,s) values
                */
            }
        }
        clock_t end = clock();
        double elapsed_time = end - start;
        printf("%f\n", elapsed_time);
    }
}
