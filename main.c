#include <stdio.h>

int main(void)
{
    int image_first[320][240] = {};
    int image_second[320][240] = {};
    /*
        --- code for reading image to pixel array here
    */
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
                    SAD_temp[x_second][y_second] = 0;
                    for (int x = 0; x < 16; x++)
                    {
                        for (int y = 0; y <16; y++)
                        {
                            int diff = image_second[x_second + x][y_second + y] - image_first[x_first + x][y_first + y];
                            if (diff < 0)
                            {
                                SAD_temp[x_second][y_second] -= diff;
                            }
                            SAD_temp[x_second][y_second] += diff;
                        }
                    }   
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
            /*
                --- may need a better way to print (r,s) values
            */
        }
    }

}