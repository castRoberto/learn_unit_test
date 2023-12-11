/********************************************************************************
 * @file data_array.h
 * @brief Data to perform calculations
 *
 * This file contains the data matrices to be used to calculate its 
 * statistical parameters.
 *
 * @author Roberto Castro Beltran
 * @date 08 november 2023
 *
 *******************************************************************************/

#ifndef _DATA_ARRAY_H_
#define _DATA_ARRAY_H_

/* Size of the Data Set */
#define SIZE                (40)
#define HOLA

namespace result_tests {

    const int median = 20;
    const int mean = 20;
    const int max = 40;
    const int min = 1;

}

unsigned char numbers[SIZE] = {

    28, 5,  11, 33, 20, 38, 7,  23, 
    30, 21, 15, 4,  12, 25, 6,  39, 
    8,  22, 40, 13, 14, 2,  32, 17, 
    29, 1,  31, 24, 9,  19, 36, 27, 
    26, 18, 35, 10, 3,  37, 34, 16
                 
};

#endif /* _DATA_ARRAY_H_ */