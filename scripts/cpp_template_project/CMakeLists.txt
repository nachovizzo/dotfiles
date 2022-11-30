cmake_minimum_required(VERSION 3.10)
project(test_project)

# Set build type
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(main main.cpp)
target_compile_options(main PRIVATE -Wall -Werror)
target_compile_features(main PRIVATE cxx_std_20)
