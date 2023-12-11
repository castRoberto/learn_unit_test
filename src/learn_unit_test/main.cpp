/********************************************************************************
 * File: main.cpp
 * 
 * Copyright 2023 Roberto Enrique Castro Beltran
 * 
 * Author: Roberto Castro
 * Date: Editted november 2023
 * 
 * Description: File with the entry point of the statistics executable. Contains 
 * the necessary library inclusions for calculations.
 *******************************************************************************/

#include "data/data_array.h"

//extern "C" {

#include "stats/stats.h"
    
//}

int main (int argc, char* argv []) {

    print_array (numbers, SIZE);

    print_statistics (numbers, SIZE);

    return 0;
}