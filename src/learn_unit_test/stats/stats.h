/********************************************************************************
 * @file stats.h
 * @brief Headers for statistics
 *
 * In this file the prototypes of all the functions that calculate 
 * attributes of matrices are declared.
 *
 * @author Roberto Castro Beltran
 * @date 08 november 2023
 *
 *******************************************************************************/


#ifndef _STATS_H_
#define _STATS_H_

#include <string.h>

#include "../common/log.h"

/**
 * @brief Calculate the median of a matrix
 *
 * Given a data array and a length, return the median.
 *
 * @param ptr Data array
 * @param len Data array length
 *
 * @return median 
 */
int find_median (unsigned char* ptr, const int len);


/**
 * @brief Calculate the mean of a matrix
 *
 * Given a data array and a length, return the mean.
 *
 * @param ptr Data array
 * @param len Data array length
 *
 * @return mean 
 */
int find_mean (unsigned char* ptr, const int len);


/**
 * @brief Calculate the maximum of a matrix
 *
 * Given a data array and a length, return the maximum.
 *
 * @param ptr Data array
 * @param len Data array length
 *
 * @return maximum 
 */
int find_maximum (unsigned char* ptr, const int len);


/**
 * @brief Calculate the minimum of a matrix
 *
 * Given a data array and a length, return the minimum.
 *
 * @param ptr Data array
 * @param len Data array length
 *
 * @return minimum 
 */
int find_minimum (unsigned char* ptr, const int len);


/**
 * @brief Sort from largest to smallest
 *
 * Given an array of data and a length, sort the array from largest to 
 * smallest. (The zeroth element should be the largest value, and the 
 * last (n-1) element should be the smallest value.).
 *
 * @param ptr Data array
 * @param len Data array length
 *
 */
void sort_array (unsigned char* ptr, const int len);


/**
 * @brief Print the array to the screen
 *
 * Given an array of data and a length, print the array to the screen.
 *
 * @param ptr Data array
 * @param len Data array length
 * 
 * @return string to print 
 */
std::string print_array (unsigned char* ptr, const int len);


/**
 * @brief Print the array to the screen
 *
 * A function that prints the statistics of an array including minimum, 
 * maximum, mean and median.
 *
 * @param ptr Data array
 * @param len Data array length
 * 
 * @return string to print 
 */
std::string print_statistics (unsigned char* ptr, const int len);

#endif  /* _STATS_H_ */