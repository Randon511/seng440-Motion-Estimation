/*
This code contains software pipelining for both y and x of SAD calculation
*/

#include <stdio.h>
#include <stdint.h>
#include <limits.h>
// Maximum value for an integer
#define WIDTH 320
#define HEIGHT 240

#define BITS_PER_PIXEL_OFFSET 0x001C
#define DATA_OFFSET_OFFSET 0x000A

void readImage(char filename[], uint8_t pixels[HEIGHT][WIDTH])
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
    printf("%s: %d\n", filename, bitsPerPixel);
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

int calc_block_diff(int x_first_pixel, int y_first_pixel, int x_second_pixel, int y_second_pixel, uint8_t image_first[HEIGHT][WIDTH], uint8_t image_second[HEIGHT][WIDTH])
{
    int SAD_temp = 0;
    int temp_image_first = image_first[y_first_pixel][x_first_pixel];
    int temp_image_second = image_second[y_second_pixel][x_second_pixel];

    int y = 0;
    while (y != 15)
    {
        int x = 0;
        while (x != 15)
        {
            int diff = temp_image_second - temp_image_first;
            
            // Calculate absolute value without using branches
            //http://www.graphics.stanford.edu/~seander/bithacks.html#IntegerAbs
            uint32_t abs_diff;
            int const mask = (diff) >> (sizeof(int) * CHAR_BIT - 1);
            abs_diff = (diff + mask) ^ mask;
            SAD_temp += abs_diff;

            x += 1;
            temp_image_first = image_first[y_first_pixel + y][x_first_pixel + x];
            temp_image_second = image_second[y_second_pixel + y][x_second_pixel + x];
        }

        // Do the last diff for x = 15
        int diff = temp_image_second - temp_image_first;
        if (diff < 0)
        {
            SAD_temp -= diff;
        }
        else
        {
            SAD_temp += diff;
        }

        y += 1;
        temp_image_first = image_first[y_first_pixel + y][x_first_pixel];
        temp_image_second = image_second[y_second_pixel + y][x_second_pixel];
        return SAD_temp;
    }
    // Do the last diff for y = 15
    int x = 0;
    while (x != 15)
    {
        int diff = temp_image_second - temp_image_first;

        uint32_t abs_diff;
        int const mask = (diff) >> (sizeof(int) * CHAR_BIT - 1);
        abs_diff = (diff + mask) ^ mask;
        SAD_temp += abs_diff;
        
        x += 1;
        temp_image_first = image_first[y_first_pixel + y][x_first_pixel + x];
        temp_image_second = image_second[y_second_pixel + y][x_second_pixel + x];
    }
    // Do the last diff for x = 15
    int diff = temp_image_second - temp_image_first;
    uint32_t abs_diff;
    int const mask = (diff) >> (sizeof(int) * CHAR_BIT - 1);
    abs_diff = (diff + mask) ^ mask;
    SAD_temp += abs_diff;

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
    for (y_first = 0; y_first < 15; y_first++)
    {
        // Y index of the first pixel in the first block
        int y_first_pixel = y_first * 16;

        // limit the search y-range to vicinity 4 blocks
        int y_upper = 15;
        int y_lower = 0;
        if (y_first - 4 > 0 ){
            y_lower = y_first - 4;
        }
        if (y_first + 4 < 15) {
            y_upper = y_first + 4;
        }

        for (x_first = 0; x_first < 20; x_first++)
        { 
            // X index of the first pixel in the first block
            int x_first_pixel = x_first * 16;

            // limit the search x-range to vicinity 4 blocks
            int x_upper = 20;
            int x_lower = 0;
            if (x_first - 4 > 0){
                x_lower = x_first - 4;
            }
            if (x_first + 4 < 20){
                x_upper = x_first + 4;
            }

            // Min SAD value for the current block
            int min_SAD = INT_MAX;
            // Block with the associated min SAD value
            int min_x, min_y = -1;
            
            int y_second, x_second;
            // for each 16x16 block in second iamge within vicinity 4 blocks from block of first image
            for (y_second = y_lower; y_second < y_upper; y_second++)
            {
                // Y index of the first pixel in the second block
                int y_second_pixel = y_second * 16;
                for (x_second = x_lower; x_second < x_upper; x_second++)
                {
                    // X index of the first pixel in the second block
                    int x_second_pixel = x_second * 16;
                    
                    // Calculate SAD value for pair of image_second[x_second_pixel][y_second_pixel] and image_first[x_first_pixel][y_first_pixel]
                    int SAD_temp = calc_block_diff(x_first_pixel, y_first_pixel, x_second_pixel, y_second_pixel, image_first, image_second);

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
            printf("block [%i][%i] has motion vector (%i, %i)\n", y_first, x_first, min_SAD_vals[y_first][x_first][1], min_SAD_vals[y_first][x_first][2]);
            /*
                --- may need a better way to print (r,s) values
            */
        }
    }
}
