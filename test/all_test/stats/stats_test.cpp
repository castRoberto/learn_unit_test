#include "CppUTest/TestHarness.h"

//extern "C" {

#include "stats.h"
    
//}

#include "data_array.h"

TEST_GROUP(stats_test_group) {

    void setup() {

        // Initialize before each test
    
    }

    void teardoun () {

        // Deinitialize after each test

    }

};

/* Print array test */
TEST (stats_test_group, print_array_test) {

    std::string str_printed = print_array (numbers, SIZE);

}

/* Median test */
TEST (stats_test_group, median_test) {

    CHECK_EQUAL (find_median (numbers, SIZE), result_tests::median);

}

/* Mean test */
TEST (stats_test_group, mean_test) {

    CHECK_EQUAL (find_mean (numbers, SIZE), result_tests::mean);

}

/* Get maximun test */
TEST (stats_test_group, maximum_test) {

    CHECK_EQUAL (find_maximum (numbers, SIZE), result_tests::max);

}

/* Get minimun test */
TEST (stats_test_group, minimum_test) {

    CHECK_EQUAL (find_minimum (numbers, SIZE), result_tests::min);

}

/* Sort test */
TEST (stats_test_group, sorting_test) {

    int diferences = 0;
    sort_array (numbers, SIZE);

    for (int i = SIZE - 1; i >= 0; i--) {

        if (numbers[i] != SIZE - i) {
            diferences++;
        }

    }

    CHECK_EQUAL (diferences, 0);

}

/* Print statistics test */
TEST (stats_test_group, print_stats_test) {

    print_statistics (numbers, SIZE);

}