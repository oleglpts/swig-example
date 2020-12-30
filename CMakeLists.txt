cmake_minimum_required(VERSION 3.5,1)
project(wget_test C)

set(CMAKE_C_STANDARD 99)

add_executable(wget_test main.c test_wget.c test_wget.h)
link_directories(/usr/local/lib)
target_link_libraries(wget_test wget)
