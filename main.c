#include <stdio.h>

// Maximum value for an integer
#define INT_MAX 2147483647

int main(void)
{
    int image_first[320][240] = {};
    int image_second[320][240] = {};
    /*
        --- code for reading image to pixel array here
    */

    int min_SAD_vals[20][15][3] = {};

    // For each 16x16 block in first image
    for (int x_first = 0; x_first < 20; x_first++)
    {
        for (int y_first = 0; y_first < 15; y_first++)
        { 
            // Min SAD value for the current block
            int min_SAD = INT_MAX;
            // Block with the associated min SAD value
            int min_x, min_y = -1;

            // For each 16x16 block in second image
            for (int x_second = 0; x_second < 20; x_second++)
            {
                for (int y_second =0; y_second < 15; y_second++)
                {
                    // Calculate SAD value for pair of image_second[x_second][y_second] and image_first[x_first][y_first]
                    int SAD_temp = 0;
                    for (int x = 0; x < 16; x++)
                    {
                        for (int y = 0; y <16; y++)
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
            min_SAD_vals[x_first][y_first][0] = min_SAD;
            // r for the block with the min SAD value
            min_SAD_vals[x_first][y_first][1] = min_x - x_first;
            // s for the block with the min SAD value
            min_SAD_vals[x_first][y_first][2] = min_y - y_first;

            // Print the r and s corresponding to the smallest SAD for image_first[x_first][y_first] block
            printf("block [%i][%i] has motion vector (%i, %i)\n", x_first, y_first, min_SAD_vals[x_first][y_first][0], min_SAD_vals[x_first][y_first][2]);
            /*
                --- may need a better way to print (r,s) values
            */
        }
    }

}